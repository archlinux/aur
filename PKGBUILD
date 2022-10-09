# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin
pkgver=0.2.4
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=catppuccin.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a800f46c9dccf1f0d978d3bf5ca8a570510fca3dcea89da06e6bae7c507ccb92')

package() {
	cd "nvim-$pkgver"
	find autoload colors doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
