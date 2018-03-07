# Maintainer: CupIvan <mail@cupivan.ru>

pkgname='ricoh-sp150-util'
pkgver='1.0'
pkgrel=12

pkgdesc="Ricoh utility for SP150 series"
arch=('x86_64')
url="http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp150/sp150.htm"
license=('unknown')

source=("http://support.ricoh.com/bb/pub_e/dr_ut_e/0001297/0001297723/V10_12/r77142L2.exe")
md5sums=('33e894bf665ef8cef324f466eb48e750')

build() {
	ar x RICOH-SP-150SU-SP-150_1.0-12_all.deb
	tar -xf data.tar.gz
	rm -r opt/RICOH/app
}

package() {
	cp -r opt $pkgdir/
	cp -r etc $pkgdir/
	cd $pkgdir/opt/RICOH/share
	tar -xzf app_amd64.tar.gz
	rm -r *.gz
	DIR="../../../usr/bin"
	mkdir -p $DIR
	ln -s "/opt/RICOH/share/RICOH Printer" $DIR
}
