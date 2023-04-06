# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin
pkgver=1.1.1
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=catppuccin.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c6944631e3afd0f929a10bf37be40cfeade68d787f41de52d5bd58fdf7941587')

package() {
	cd "nvim-$pkgver"
	local dirs=(after autoload colors doc lua)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
