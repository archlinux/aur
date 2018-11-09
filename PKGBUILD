# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=dust
pkgver=0.3.1
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
url="https://github.com/bootandy/dust"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bootandy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('abac2aa78deefa16f991d8f4ba91e7d717fb1d8559d5f030d962c7c967e19501a4b78c1d19d43cbe4b4aa3429102dab891076375084196abd55844b2c0bf6dfb')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
