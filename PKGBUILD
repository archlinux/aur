# Maintainer: dringsim <dringsim@qq.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-scrollview
pkgver=6.0.0
pkgrel=1
pkgdesc="Neovim plugin that displays interactive vertical scrollbars"
arch=('any')
url="https://github.com/dstein64/nvim-scrollview"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7F364815C1CA48892BAA4613497D5D9597B93A4D9D6651328355DEC9138CB65A')

PURGE_TARGETS=('tags')

package() {
	cd "nvim-scrollview-$pkgver"
	find autoload doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
