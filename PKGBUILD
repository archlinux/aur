# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: orhun <orhunparmaksiz@gmail.com>

pkgname=faint
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=1.2.0
pkgrel=2
arch=('any')
url="https://github.com/salman-abedin/faint"
license=('GPL')
depends=('fzf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('266a9684bb2b0c948992b17f7a04c7f35cfca095f71d65fd2854c656feeb68bb')

prepare() {
	cd "$pkgname-$pkgver"
	mv src/faintrc ./
}

package() {
	cd "$pkgname-$pkgver"
	make DIR_BIN="$pkgdir/usr/bin" install
	install -Dm 644 faintrc -t "$pkgdir/etc/"
	install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
