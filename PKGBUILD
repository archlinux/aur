# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-headlines
pkgver=3.3.0
pkgrel=1
pkgdesc="Adds highlights for text filetypes"
arch=('any')
url="https://github.com/lukas-reineke/headlines.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install=headlines.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('864d0ea663c1265ca99518868d3dfb451b3c7a247f6c9001dcce6f34801cc485')

package() {
	cd "headlines.nvim-$pkgver"
	find doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
