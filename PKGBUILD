# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=lombok-eclipse
pkgver=1.16.12
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

sha256sums=('fef48ad024a3131cb5e1e7d52f33c97cb223b6a8e5bab2e57a10825d58394159')

# vim:set ts=2 sw=2 et:
