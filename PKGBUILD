# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers
pkgver=1.2.1
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7570228259f09ab4c1af213481b5706304b793f650f70f0194beeb0a72f5a345')

package() {
	cd "registers.nvim-$pkgver"
	find lua plugin syntax -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
