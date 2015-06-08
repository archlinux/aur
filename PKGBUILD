# Contributor: Kozec <kozec at kozec dot com>

pkgname=lombok-eclipse
pkgver=1.16.4
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
	mkdir -p "$pkgdir"/usr/share/eclipse
	cp "$srcdir"/lombok.jar "$pkgdir"/usr/share/eclipse
	cp "$srcdir"/lombok-api.jar "$pkgdir"/usr/share/eclipse
}

md5sums=('b08407411bca4123c3804e63d92e335e')
