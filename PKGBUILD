# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers
pkgver=1.4.1
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
checkdepends=('neovim-plenary')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1253b7fd7f1d5d90c04c17534c7a85c899c10de186829f103ac7533dba8958c7')

check() {
	cd "registers.nvim-$pkgver"
	make test
}

package() {
	cd "registers.nvim-$pkgver"
	find lua plugin syntax \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
