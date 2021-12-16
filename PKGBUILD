# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-renamer
pkgver=3.0.3
pkgrel=1
pkgdesc="VSCode-like renaming for Neovim"
arch=('any')
url="https://github.com/filipdutescu/renamer.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
install=renamer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1b933655ce61aa9d7385100993544ec14b5ac1e59876e9b83d129df9b2bf61ac')

package() {
	cd "renamer.nvim-$pkgver"
	find autoload doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
