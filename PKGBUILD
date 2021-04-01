# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=etl
pkgname=etlcpp
pkgver=20.8.0
pkgrel=1
pkgdesc="Embedded Template Library"
arch=('x86_64')
url="https://www.etlcpp.com/"
license=('MIT')
makedepends=('cmake')
checkdepends=()
source=("https://github.com/ETLCPP/etl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d1cb2d95f060b646507aea2b12110d15ce66e34ff616eabc0b667323c849ecca')

prepare() {
    :
}

build() {
    :
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cmake -Bbuild_test test
    cmake --build build_test
    ./build_test/etl_tests
}

package() {
    mkdir -p "${pkgdir}/usr/include"
    cp -r "${_pkgname}-${pkgver}/include" "${pkgdir}/usr/."
    rm -rf "${pkgdir}/usr/include/etl/.vscode"

    install -D -m644 \
        "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

