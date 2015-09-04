# Contributor: Kozec <kozec at kozec dot com>

pkgname=lombok-eclipse
pkgver=1.16.6
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

sha256sums=('e0a471be03e1e6b02bf019480cec7a3ac9801702bf7bf62f15d077ad4df8dd5d')
