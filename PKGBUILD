# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lush
pkgver=1.0.0
pkgrel=1
pkgdesc="A colorscheme creation aid for Neovim"
arch=('any')
url="https://github.com/rktjmp/lush.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=lush.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('29df7b46562ee165af42825c3ed94f43698992f7b8f8112ed960deaf6825d259')

package() {
	cd "lush.nvim-$pkgver"
	find doc examples lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
