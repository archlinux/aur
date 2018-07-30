# Maintainer: Justin Gallardo <me@jirw.in>
pkgname=xjwt
pkgver=1.0.3
pkgrel=1
pkgdesc="Minimal C library for validation of real-world JWTs"
arch=(x86_64)
url="https://github.com/ScaleFT/libxjwt"
license=('Apache')
depends=(openssl jansson)
source=("https://github.com/ScaleFT/libxjwt/releases/download/v1.0.3/libxjwt-$pkgver.tar.gz")
sha256sums=(c23488b452be920efbbafe01439269b68edca1b750c63608b005c482beb75f40)

prepare() {
	cd "lib$pkgname-$pkgver"
}

build() {
	cd "lib$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "lib$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
