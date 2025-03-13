# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-orgmode
_pkg="${pkgname#neovim-}"
pkgver=0.5.2
pkgrel=1
pkgdesc="Orgmode clone for Neovim"
arch=('any')
url="https://github.com/kristijanhusak/orgmode.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=orgmode.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('29f4473944e1d5fd78d662fc3b8cfec140c5bb72836e72c9d9c50132439161cc')

package() {
	cd "$_pkg-$pkgver"
	dirs=(doc ftplugin indent plugin lua syntax)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
