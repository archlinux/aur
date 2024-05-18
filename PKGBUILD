# Maintainer: Atte Lautanala <atte@lautana.la>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin
pkgver=1.7.0
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=catppuccin.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e0a47983a2a64a0e778ad8636760bfe5f36c86d7bc6deb0cb777f84b892c93c6')

package() {
	cd "nvim-$pkgver"
	local dirs=(after autoload colors doc lua)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
