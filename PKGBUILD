# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=cydia-impactor
_pkgname=Impactor
pkgver=0.9.41
pkgrel=1
pkgdesc="A GUI tool for working with mobile devices"
arch=('i686' 'x86_64')
url="http://www.cydiaimpactor.com"
license=('unknown')
depends=('gtk2' 'fontconfig' 'libudev0-shim' 'ncurses5-compat-libs')
source_i686=("https://cache.saurik.com/impactor/l32/Impactor32_${pkgver}.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/Impactor64_${pkgver}.tgz")
md5sums_i686=('87f1749012cbaf146c06fac1016da948')
md5sums_x86_64=('7c89ce94ee1847b0013ff04ae7e7083b')

package() {
	cd "$srcdir/"

	msg2 "Installing library"
	mkdir -p "$pkgdir/usr/lib"
	install -Dm755 $_pkgname.so "$pkgdir/usr/lib/"

	msg2 "Installing dat file"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 $_pkgname.dat "$pkgdir/usr/bin"

	msg2 "Installing binary"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/"
}
