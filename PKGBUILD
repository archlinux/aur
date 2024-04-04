# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lush
pkgver=2.0.1
pkgrel=1
pkgdesc="A colorscheme creation aid for Neovim"
arch=('any')
url="https://github.com/rktjmp/lush.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=lush.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('494c1b1a9fe86e2d3bda713d9742ba538e890e5411e34f386c59879898e9a172')

package() {
	cd "lush.nvim-$pkgver"
	dir=(doc examples lua plugin spec)
	find "${dir[@]}" -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
