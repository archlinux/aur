# Maintainer: Eden Tyler-Moss <eden@etylermoss.com>

pkgname=vjson-schema
pkgver=1.1.0
pkgrel=1
pkgdesc="Validate JSON file(s) against a JSON schema."
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/etylermoss/vjson-schema"
license=("GPL3")
depends=("nlohmann-json" "json-schema-validator" "glibc" "gcc-libs")
provides=("vjson-schema")
source=("https://github.com/etylermoss/vjson-schema/archive/$pkgver.tar.gz")
sha256sums=(6ff79f059f04b4c98dc571f240596e7b8aac5fce7aedb348a83b2fe30f0fa372)

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -B build/
	cmake --build build/ -- -j 6
}

package() {
	DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver/build"
}
