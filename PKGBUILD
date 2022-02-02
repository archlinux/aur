# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-headlines
pkgver=2.1.0
pkgrel=1
pkgdesc="Adds highlights for text filetypes"
arch=('any')
url="https://github.com/lukas-reineke/headlines.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=headlines.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9b54e4f76172ec4a8ee796cffe49c2d712ff8d0e5a1156abc5133a17dde9c863')

package() {
	cd "headlines.nvim-$pkgver"
	find doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
