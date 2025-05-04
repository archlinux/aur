# Maintainer: Atte Lautanala <atte@lautana.la>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin
pkgver=1.10.0
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=catppuccin.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('819ef96b7955b6c2bc773ab5694c8e66f503a92c0f9f8ec2676015dc7f77a8e5d94d850796c15c9cb543c1d53958999e980cbaab258c79261da6a8e559a633ad')

package() {
	cd "nvim-$pkgver"
	local dirs=(after autoload colors doc lua)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
