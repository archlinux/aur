# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-bqf
pkgver=0.2.0
pkgrel=1
pkgdesc="Better quickfix window in Neovim"
arch=('any')
url="https://github.com/kevinhwang91/nvim-bqf"
license=('BSD')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
optdepends=('fzf>=0.24.0' 'neovim-tree-sitter')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('534b6c6185d57240bd8934818b338087e357de518098c7de5f286ecddd20a751')

package() {
	cd "nvim-bqf-$pkgver"
	find after lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
