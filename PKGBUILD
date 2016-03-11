pkgname=lombok-eclipse
pkgver=1.16.8
pkgrel=1
pkgdesc="Project Lombok integrated to Eclipse installation"
arch=("any")
url="http://projectlombok.org"
license=('MIT')
makedepends=('java-runtime')
depends=('eclipse' 'java-runtime')
install=lombok.install
source=("http://projectlombok.org/downloads/lombok.jar")
noextract=("lombok.jar")
options=(!makeflags)

build() {
	cd "$srcdir"
	java -jar lombok.jar publicApi
}
package() {
	mkdir -p "$pkgdir"/usr/lib/eclipse
	cp "$srcdir"/lombok.jar "$pkgdir"/usr/lib/eclipse
	cp "$srcdir"/lombok-api.jar "$pkgdir"/usr/lib/eclipse
}

sha256sums=('fe32b29b7b33eb2b19866cbc5345c59c9984a6036cc396856a04c0d09f99ea68')
