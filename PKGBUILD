# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-gitsigns
pkgver=1.0.2
pkgrel=1
pkgdesc="Git signs written in pure Lua"
arch=('any')
url="https://github.com/lewis6991/gitsigns.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('git' 'neovim')
install=gitsigns.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e34c2ab2079a84e99db2925c5562c60d9ee7c4c350dcad8813276f71c878a45')

package() {
	cd "gitsigns.nvim-$pkgver"
	find doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
