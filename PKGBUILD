# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=lombok-eclipse
pkgver=1.16.14
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

sha256sums=('0c288109879afc5bcb88f09534a74c61306e92459a911078e1180aaee9a932f9')

# vim:set ts=2 sw=2 et:
