# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-scrollview
pkgver=3.0.2
pkgrel=1
pkgdesc="Neovim plugin that displays interactive vertical scrollbars"
arch=('any')
url="https://github.com/dstein64/nvim-scrollview"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ed639b013a6fba9349dff4a6758ca9689eb2afb75086d1c3a87217bc573b2f57')

PURGE_TARGETS=('tags')

package() {
	cd "nvim-scrollview-$pkgver"
	find doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
