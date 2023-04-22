# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tokyonight
_pkg=tokyonight.nvim
pkgver=1.16.0
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
sha256sums=('c9532823c849b06f3bccf3a367e48d038d2cd0054654a693d6cab685dde7911c')

package() {
	local dirs=(autoload colors doc lua)
	cd "$_pkg-$pkgver"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	find extras -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
