# Maintainer: Atte Lautanala <atte@lautana.la>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin
pkgver=1.11.0
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=catppuccin.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('bba591a4a46aa8a4a4271fb2e6ef5e99e8196a7e5729517f33afc40215e291273d115088626ce2d424a895cfed710e81d6d5ba5322780b48bf955e40f461b3b5')

package() {
	cd "nvim-$pkgver"
	local dirs=(after autoload colors doc lua)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
