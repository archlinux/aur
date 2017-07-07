# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=lombok-eclipse
pkgver=1.16.18
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

sha256sums=('9d957f572386b9e257093a45b148f9b411cff80d9efd55eaf6fca27002d2e4d9')

# vim:set ts=2 sw=2 et:
