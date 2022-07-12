# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-telescope
pkgver=0.1.0
pkgrel=1
pkgdesc="Extensible fuzzy finder for lists"
arch=('any')
url="https://github.com/nvim-telescope/telescope.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
optdepends=(
	'bat: for inline previews'
	'fd'
	'ripgrep'
	'neovim-tree-sitter'
	'vim-devicons')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('56d3b731ab26e0534ae28243841cf3ba51d41791b432b7b3a619004e21d5c37d')

package() {
	cd "telescope.nvim-$pkgver"
	find data doc lua plugin \
		-not \( -path lua/tests -prune \) \
	  -type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
