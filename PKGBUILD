# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-rg
pkgver=1.3.6
pkgrel=1
pkgdesc="ripgrep source for neovim-cmp"
arch=('any')
url="https://github.com/lukas-reineke/cmp-rg"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim-cmp' 'ripgrep')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d82aded74b490bc20ac172bd81af92f66c92b2f519354f8db7df66f0e56233dd')

package() {
	cd "cmp-rg-$pkgver"
	find after doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
