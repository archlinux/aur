# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-indent-blankline
pkgver=2.10.6
pkgrel=1
pkgdesc="Indent guides for Neovim"
arch=('any')
url="https://github.com/lukas-reineke/indent-blankline.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=indent-blankline.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('07fa91ee4d0103de385886b5f0eaa95523dd8b81481643afc20f3572fafa0ee7')

package() {
	cd "indent-blankline.nvim-$pkgver"
	find autoload doc lua plugin \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
