# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-feline
pkgver=1.1.3
pkgrel=1
pkgdesc="Minimal, stylish, and customizable statusline for Neovim"
arch=('any')
url="https://github.com/feline-nvim/feline.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
install=feline.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a047ea08d93cf241f0c0041c49c1158cfc31895e0e64baf07a84c884ca605863')

package() {
	cd "feline.nvim-$pkgver"
	find doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md USAGE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
