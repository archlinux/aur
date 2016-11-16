# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=cydia-impactor
_pkgname=Impactor
pkgver=0.9.34
pkgrel=1
pkgdesc="A GUI tool for working with mobile devices"
arch=('i686' 'x86_64')
url="http://www.cydiaimpactor.com"
license=('custom')
depends=('gtk2' 'fontconfig' 'libudev0-shim' 'ncurses5-compat-libs')
source_i686=("https://cache.saurik.com/impactor/l32/Impactor32_${pkgver}.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/Impactor64_${pkgver}.tgz")
md5sums_i686=('20145bb235e9820c57a31f305a8fc2f6')
md5sums_x86_64=('5bd9269ba1b8eebf406f42da7e7ef26d')

package() {
	cd "$srcdir/"

	msg2 "Installing library"
	mkdir -p "$pkgdir/usr/lib/"
	install -Dm755 $_pkgname.so "$pkgdir/usr/lib/"

	msg2 "Installing binary"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/"
}
