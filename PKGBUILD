# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-orgmode
_pkg="${pkgname#neovim-}"
pkgver=0.3.1
pkgrel=1
pkgdesc="Orgmode clone for Neovim"
arch=('any')
url="https://github.com/kristijanhusak/orgmode.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=orgmode.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f4610e606cd67db4ed70d840eae70e7092a9ed17baab1d31f7496492e74ab0f7')

package() {
	cd "$_pkg-$pkgver"
	dirs=(doc ftplugin indent lua syntax)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md DOCS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
