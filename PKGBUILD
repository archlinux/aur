# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers
pkgver=2.0.0
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
install=registers.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc9260621a319e039f009a21fd75cf1124b186e06727624c102bd1aaaeab7bb6')

package() {
	cd "registers.nvim-$pkgver"
	find doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
