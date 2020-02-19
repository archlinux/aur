# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=dust
pkgver=0.5.0
pkgrel=1
pkgdesc="du + rust = dust. Like du but more intuitive"
url="https://github.com/bootandy/dust"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bootandy/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('74c4d0df3fdfcd88db2f3fd4eb4d0ca55e6bb6d294b5a2b189fd411253d69222188420026cdc2b0e2fab89151fbd020accb03e70d6b793c92b11789b22d5444f')

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
