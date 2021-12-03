# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-rg
pkgver=1.3.5
pkgrel=2
pkgdesc="ripgrep source for neovim-cmp"
arch=('any')
url="https://github.com/lukas-reineke/cmp-rg"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim-cmp' 'ripgrep')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('81f773279e84c4a19fa76b3fd773305bcf3b128c9dbbef39ce23e00998d98c21')

package() {
	cd "cmp-rg-$pkgver"
	find after doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
