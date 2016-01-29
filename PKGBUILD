# Maintainer: Zachary Koesters <zkoesters@utdallas.edu>

pkgname="collada-dom"
provides=("colladadom")
pkgver=2.4.4
pkgrel=1
pkgdesc="An API that provides a C++ object representation of a COLLADA XML instance document."
url="https://github.com/rdiankov/collada-dom/tree/v2.4.4"
license=("custom")
arch=("any")
depends=("libxml2" "boost-libs" "pcre")
makedepends=("cmake" "boost")
source=("https://github.com/rdiankov/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("0dfa494827faa971310c871535b319cadbd0c2d6958ee11b303c61a55a5a437a")

build() {
    cd "${pkgname}-${pkgver}"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "../${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "licenses/license_e.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
