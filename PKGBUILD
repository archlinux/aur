# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-indent-blankline
pkgver=2.16.0
pkgrel=1
pkgdesc="Indent guides for Neovim"
arch=('any')
url="https://github.com/lukas-reineke/indent-blankline.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=indent-blankline.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8386c198cd0e2787fddee6a5ab1ef2fb4c9fd34e70f4d5d0d9ad4325b7dd97b6')

package() {
	cd "indent-blankline.nvim-$pkgver"
	find doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
