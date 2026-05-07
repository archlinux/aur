# Contributor: Atte Lautanala <atte@lautana.la>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin
pkgver=2.0.0
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=catppuccin.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('3910ebb5ea8d53bde3d417a873cb26f209d0aadc6b16ffa77382d11d124e4cb92ca3a8ab3e21eb708c695239f5a641db47be90d418be900cd31616c9152ba55f')

package() {
	cd "nvim-$pkgver"
	local dirs=(after colors doc lua)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
