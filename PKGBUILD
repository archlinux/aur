# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-scrollview
pkgver=2.4.2
pkgrel=1
pkgdesc="Neovim plugin that displays interactive vertical scrollbars"
arch=('any')
url="https://github.com/dstein64/nvim-scrollview"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a5b5b3349855cd2cfc6aefe987dbf1ec3926848e4c05371d214980bbd613a486')

PURGE_TARGETS=('tags')

package() {
	cd "nvim-scrollview-$pkgver"
	find doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
