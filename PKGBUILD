# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=dust
pkgver=0.5.3
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
url="https://github.com/bootandy/dust"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bootandy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f58f62da0394e196369580bb67174405552a878c98dea643842b19d6aacb53b3ed6acdb2cb39c7ac18a1453d3ad53d6b6ec46bd17e3a32ba60bf55aab2fc51f6')

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
