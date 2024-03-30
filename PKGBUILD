# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tokyonight
_pkg=tokyonight.nvim
pkgver=3.0.1
pkgrel=1
pkgdesc="Dark and light theme ported from VSCode's TokyoNight"
arch=('any')
url="https://github.com/folke/tokyonight.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
provides=('neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
conflicts=('neovim-airline-tokyonight' 'neovim-lightline-tokyonight' 'neovim-lualine-tokyonight')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e0908490436ae819c6ee332c688050f5b3525056e6e8beea4c5ea3e4e0e5d455')

package() {
	local dirs=(autoload colors doc lua)
	cd "$_pkg-$pkgver"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	find extras -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
