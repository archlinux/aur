# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-renamer
pkgver=4.0.0
pkgrel=1
pkgdesc="VSCode-like renaming for Neovim"
arch=('any')
url="https://github.com/filipdutescu/renamer.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
install=renamer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ccb8a46d2c692b67b91f040852e44199450f4f7bc40783005ae52b20e7ba2e7f')

package() {
	cd "renamer.nvim-$pkgver"
	find autoload doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
