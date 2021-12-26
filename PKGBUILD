# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-quickui
pkgver=1.4.2
pkgrel=1
pkgdesc="Vim plugin that displays a user-configurable menu bar"
arch=('any')
url="https://github.com/skywind3000/vim-quickui"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f6ea5aa3ca203ee3ed325d90e8dc8772f229e773a405c9f704e857b260ff3c50')

package() {
	cd "$pkgname-$pkgver"
	find autoload colors plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md MANUAL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
