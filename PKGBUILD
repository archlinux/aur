# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp
pkgver=0.0.1
pkgrel=1
pkgdesc="Autocompletion plugin for Neovim"
arch=('any')
url="https://github.com/hrsh7th/nvim-cmp"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
optdepends=(
	'neovim-cmp-nvim-lsp: source for Neovim builtin LSP client'
	'neovim-cmp-buffer: buffer autocompletion'
	'neovim-cmp-path: path autocompletion'
	'neovim-cmp-emoji: emoji autocompletion'
	'neovim-cmp-latex-symbols: LaTeX symbol autocompletion'
	'neovim-cmp-omni: omnifunc autocompletion'
	'neovim-cmp-vsnip: vsnip autocompletion')
install=cmp.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bf09327702142ad46ee0344ea50dea7e249f8bfae728592a4ea8a2bc6ca8f5d6')

package() {
	cd "nvim-cmp-$pkgver"
	find autoload lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
