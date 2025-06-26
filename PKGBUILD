pkgname="umpire"
pkgver=0.1
pkgrel=1
pkgdesc="A blazingly fast competitive programming helper"
arch=("x86_64" "aarch64")
source=("$pkgname-$pkgver.tar.gz::https://github.com/udontur/umpire/archive/refs/tags/$pkgver.tar.gz")
url="https://github.com/udontur/umpire"
makedepends=("cmake" "make" "gcc")
sha512sums=("SKIP")
license=("GPL3")
build() {
    cd "${pkgname}-${pkgver}"
    cmake .
    cmake --build .
}
package() {
    cd "${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    cp um "${pkgdir}/usr/bin/"
    ln -s "${pkgdir}/usr/bin/um" "${pkgdir}/usr/bin/umpire"
}
