# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=lombok-eclipse
pkgver=1.16.10
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
    cd "${srcdir}"
    java -jar lombok.jar publicApi
}
package() {
    mkdir -p "${pkgdir}"/usr/lib/eclipse
    cp "$srcdir"/lombok.jar "${pkgdir}"/usr/lib/eclipse
    cp "$srcdir"/lombok-api.jar "${pkgdir}"/usr/lib/eclipse
}

sha256sums=('7e9079406585c67fe25f607c34b17fbed48da0a9bceb15c09a558444cefcef0e')

# vim:set ts=2 sw=2 et:
