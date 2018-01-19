# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=lombok-eclipse
pkgver=1.16.20
pkgrel=1
pkgdesc="Project Lombok integrated to Eclipse installation"
arch=("any")
url="http://projectlombok.org"
license=('MIT')
makedepends=('java-runtime')
depends=('eclipse' 'java-runtime')
install=lombok.install
source=('lombok.jar'::"https://projectlombok.org/downloads/lombok-${pkgver}.jar")
noextract=("lombok.jar")
options=(!makeflags)

build() {
    cd "${srcdir}"
    java -jar lombok.jar publicApi
}
package() {
    mkdir -p "${pkgdir}"/usr/lib/eclipse
    cp "$srcdir"/lombok.jar "${pkgdir}"/usr/lib/eclipse
    cp "$srcdir"/lombok-api.jar "${pkgdir}"/usr/lib/eclipse
}

sha256sums=('c5178b18caaa1a15e17b99ba5e4023d2de2ebc18b58cde0f5a04ca4b31c10e6d')

# vim:set ts=2 sw=2 et:
