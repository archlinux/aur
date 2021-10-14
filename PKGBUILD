# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-gitsigns
pkgver=0.3
pkgrel=1
pkgdesc="Git signs written in pure Lua"
arch=('any')
url="https://github.com/lewis6991/gitsigns.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('git' 'neovim>=0.5' 'neovim-plenary')
install=gitsigns.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('71fe7489d9cbdc49937baced32265aebbfe12158dfb7589c8d2c2cebf31f51d3')

package() {
	cd "gitsigns.nvim-$pkgver"
	find doc lua teal -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
