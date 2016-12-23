# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=cydia-impactor
_pkgname=Impactor
pkgver=0.9.37
pkgrel=1
pkgdesc="A GUI tool for working with mobile devices"
arch=('i686' 'x86_64')
url="http://www.cydiaimpactor.com"
license=('unknown')
depends=('gtk2' 'fontconfig' 'libudev0-shim' 'ncurses5-compat-libs')
source_i686=("https://cache.saurik.com/impactor/l32/Impactor32_${pkgver}.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/Impactor64_${pkgver}.tgz")
md5sums_i686=('e9da2009f753a450b71c5c22daca0a4d')
md5sums_x86_64=('3339cd4e4f0181aba8fb58c7d1a234f8')

package() {
	cd "$srcdir/"

	msg2 "Installing library"
	mkdir -p "$pkgdir/usr/lib"
	install -Dm755 $_pkgname.so "$pkgdir/usr/lib/"

	msg2 "Installing dat file"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	install -Dm644 $_pkgname.dat "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "$pkgdir/usr/share/$pkgname/$_pkgname.dat" "$pkgdir/usr/bin"

	msg2 "Installing binary"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/"
}
