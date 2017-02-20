# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=nautilus-hide
pkgver=0.2.1
pkgrel=1
pkgdesc="Extension for Nautilus to hide files without renaming them"
arch=('any')
url="https://github.com/brunonova/$pkgname"
license=('GPL3')
depends=('nautilus' 'python-nautilus' 'xdotool')
makedepends=('cmake>=2.6' 'gettext')
install="$pkgname.install"
source=("https://github.com/brunonova/$pkgname/releases/download/v$pkgver/${pkgname}_$pkgver.tar.xz")
md5sums=('7eea2effd69b779f8caddb480352fb68')

build() {
	cd "$srcdir"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir" install
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "NEWS" "$pkgdir/usr/share/doc/$pkgname/NEWS"
	install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
}
