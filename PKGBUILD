# Maintainer: Ivan Naydonov <samogot@gmail.com>
pkgname=ricoh-sp220-ppd
pkgver=1.01
pkgrel=1

pkgdesc="CUPS driver for Ricoh SP220 series"
arch=('i686' 'x86_64')
url="http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp221s/sp221s.htm"
license=('unknown')
group=('ricoh-sp220-all')

depends=('cups' )
makedepends=('binutils' 'p7zip')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
	source=(http://support.ricoh.com/bb/pub_e/dr_ut_e/0001300/0001300718/V101/r78183en.exe)
	md5sums=('6e0f7e79d5873b1152446ea7aa8dc438')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386' 
	source=(http://support.ricoh.com/bb/pub_e/dr_ut_e/0001300/0001300717/V101/r78182en.exe)
	md5sums=('a7c88938d47348597eed3127ba719048')
fi

prepare() {
	ar x sp-200-series-gdi-$pkgver-$ARCH.deb
	tar -zxf data.tar.gz
}

package() {
	install -d $pkgdir/usr
	cp -a usr $pkgdir
}
