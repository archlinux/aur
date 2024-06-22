# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: AureumApes <aureumapes@duck.com>
pkgname=information-image
pkgver=1.0.2
pkgrel=1
pkgdesc="A tool for transforming files and text into images and vice versa"
arch=('any')
url="https://github.com/aureumapes/information-image"
license=('MIT')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aureumapes/information-image/archive/v$pkgver.tar.gz")
sha256sums=('f2585a0d4c9f152a25d1bc35090e5302693759c2dd81f9dcc549e4751bceb31c')
build() {
	cd "$pkgname-$pkgver"
	go build
}
package() {
	cd "$pkgname-$pkgver"
	install -vDm755 -t "$pkgdir/usr/bin" information-image
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
