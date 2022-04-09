# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-indent-blankline
pkgver=2.15.1
pkgrel=1
pkgdesc="Indent guides for Neovim"
arch=('any')
url="https://github.com/lukas-reineke/indent-blankline.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=indent-blankline.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('621e6e14bb43d7460f1112ba25fa4bc5efb7427274c3d10cf968e391a6deebab')

package() {
	cd "indent-blankline.nvim-$pkgver"
	find doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
