# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lennard Hofmann <lennard dot hofmann at web dot de>

pkgname=fish-humantime-git
pkgver=1.0.0.r6.g53b2adb
pkgrel=2
pkgdesc='Fish plugin for making timestamps human-readable'
arch=('any')
url="https://github.com/jorgebucaran/humantime.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=('fish-humantime')
conflicts=('fish-humantime')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('CA88B7CBEDCEE375F2376C53E54BA3C0E646DB30')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

## tests did not return meaningful results

package() {
	cd "$pkgname"
	install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" functions/humantime.fish
	install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
