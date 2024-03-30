# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers
pkgver=2.3.0
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL-3.0-or-later')
groups=('neovim-plugins')
depends=('neovim')
install=registers.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('310c58b64b86ceb0264c126e48763be04c064096a148062f7a5048dcdbbcaf82')

package() {
	cd "registers.nvim-$pkgver"
	find doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
