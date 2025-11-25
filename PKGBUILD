# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp
pkgver=0.0.2
pkgrel=1
pkgdesc="Autocompletion plugin for Neovim"
arch=('any')
url="https://github.com/hrsh7th/nvim-cmp"
license=('MIT')
groups=('neovim-plugins')
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
sha256sums=('e8e69a2116df9f3d1906c4d94fc093dfa30611cfb4cf30119174c0fa9ece10a8')

package() {
    depends=('neovim')
    cd "nvim-cmp-$pkgver"
    find autoload doc lua plugin \
        -type f \
        -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
