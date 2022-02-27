# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-bqf
pkgver=0.3.1
pkgrel=1
pkgdesc="Better quickfix window in Neovim"
arch=('any')
url="https://github.com/kevinhwang91/nvim-bqf"
license=('BSD')
groups=('neovim-plugins')
depends=('neovim')
optdepends=('fzf' 'neovim-tree-sitter')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('52aa276e848298c47dde67e86d76e3af118084680b453919a75f75e65eb93843')

package() {
	cd "nvim-bqf-$pkgver"
	find after doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
