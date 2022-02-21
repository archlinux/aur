# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-bqf
pkgver=0.3.0
pkgrel=1
pkgdesc="Better quickfix window in Neovim"
arch=('any')
url="https://github.com/kevinhwang91/nvim-bqf"
license=('BSD')
groups=('neovim-plugins')
depends=('neovim')
optdepends=('fzf' 'neovim-tree-sitter')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('241d764e39099692701ae98545a25991415b9793964ea20918573e639c230bf0')

package() {
	cd "nvim-bqf-$pkgver"
	find after doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
