# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-quickui
pkgver=1.4.3
pkgrel=1
pkgdesc="Vim plugin that displays a user-configurable menu bar"
arch=('any')
url="https://github.com/skywind3000/vim-quickui"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('27575bb6d26dc3e9ba1b3e34fb3bbb6178e36f8eb45684fa9e14d9e4f6df7fdd')

package() {
	cd "$pkgname-$pkgver"
	find autoload colors plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md MANUAL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
