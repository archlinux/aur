# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-bqf
pkgver=0.3.3
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
sha256sums=('7b7ddf2c38e23d0b6ad941350ba0cb44ae41fb5503944fe5e80f33ce9044c963')

package() {
	cd "nvim-bqf-$pkgver"
	find after doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
