# Maintainer: Zachary Koesters <zkoesters@utdallas.edu>

pkgname="collada-dom"
provides=("colladadom")
pkgver=2.4.3
pkgrel=2
pkgdesc="An API that provides a C++ object representation of a COLLADA XML instance document."
url="https://github.com/rdiankov/collada-dom/tree/v2.4.3"
license=("custom")
arch=("any")
depends=("libxml2" "boost-libs" "pcre")
makedepends=("cmake" "boost")
source=("https://github.com/rdiankov/${pkgname}/archive/v${pkgver}.zip")
sha256sums=("a97b9cdf4244dda3260fc51862c77f5121fb5e8334c1d4af9762ccb9f85de704")

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
