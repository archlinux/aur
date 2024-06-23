# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: aureumapes <aureumapes@duck.com>
pkgname=candle
pkgver=1.0.0
pkgrel=1
pkgdesc="An interpreted esoteric Language"
arch=(any)
url="https://github.com/aureumapes/candle"
license=('MIT')
makedepends=("go>=1.21")
source=("$pkgname-$pkgver.tar.gz::https://github.com/aureumapes/candle/archive/v$pkgver.tar.gz")
sha256sums=(602d418b0a618b270b4266e1c261ab2e22a8b211d4d936351ba9368b8d913e0a)

build() {
	cd "$pkgname-$pkgver"
	go build	
}
package() {
	cd "$pkgname-$pkgver"
	install -vDm777 -t "$pkgdir/usr/bin" candle
}
