# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-autopair
pkgver=1.0.4
pkgrel=1
pkgdesc="Auto-complete matching pairs in the Fish command line"
arch=('any')
url="https://github.com/jorgebucaran/autopair.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
conflicts=('fish-pisces')
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('CA88B7CBEDCEE375F2376C53E54BA3C0E646DB30')

package() {
	cd "$pkgname"
	install -Dm644 conf.d/autopair.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	find functions -type f -exec install -Dm644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
