# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=dust
pkgver=0.4.41
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
url="https://github.com/bootandy/dust"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bootandy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9814506d0fbf0902791149059b9c9a33994d4112a157d30c314b8ca2be60ef209301ad9fcad12d2d4f27c42453042b165d689115a9a04542f1b7e2c0b61a3221')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
