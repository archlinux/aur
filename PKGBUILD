# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tree-lua
pkgver=1.6.7
pkgrel=1
pkgdesc="File tree explorer for Neovim"
arch=('any')
url="https://github.com/kyazdani42/nvim-tree.lua"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
optdepends=('neovim-web-devicons')
install=setup.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('89d946fb04127a586c1ea41a7976eb0498bd09243ecb7137256622d80c1b881a')

PURGE_TARGETS=('.gitignore')

package() {
	cd "nvim-tree.lua-$pkgver"
	find doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
