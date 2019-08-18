# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=ricoh-spc261sfnw-ppd
pkgver=1.0.1
_pkgver=1.01
pkgrel=1
pkgdesc="CUPS driver for Ricoh SP C261SFNw series"
arch=("x86_64")
url="http://support.ricoh.com/bb/html/dr_ut_e/rc3/model/spc261sfnw/spc261sfnw.htm"
license=("unknown")
depends=("cups" )
makedepends=("binutils" "p7zip")

source=("http://support.ricoh.com/bb/pub_e/dr_ut_e/0001305/0001305275/V101/r80942en.exe")
sha256sums=("53007663e4a5a0c6c3e3b81c82c5a5ea740aceb36496be8812c0b714aafc19cd")

prepare() {
	ar x sp260-series-mf-pcl-${_pkgver}-noarch.deb
	tar -zxf data.tar.gz
}

package() {
	install -d $pkgdir/usr
	cp -a usr $pkgdir
}
