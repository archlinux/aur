# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-catppuccin
pkgver=0.2.3
pkgrel=1
pkgdesc="Soothing pastel theme for Neovim"
arch=('any')
url="https://github.com/catppuccin/nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=catppuccin.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8831c0516c4b3fc20bfc417ce7b705da860ca9f4961c9bc57ebeeadef7b9969e')

package() {
	cd "nvim-$pkgver"
	find autoload colors doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
