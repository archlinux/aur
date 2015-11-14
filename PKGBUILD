# Maintainer: Eric Biggers <ebiggers3@gmail.com>
pkgname=libdivsufsort
pkgver=2.0.1
pkgrel=2
pkgdesc="A lightweight suffix-sorting library"
arch=("i686" "x86_64")
url="https://github.com/y-256/libdivsufsort"
license=("BSD")
makedepends=("cmake")
source=("https://github.com/y-256/libdivsufsort/archive/${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install 
    install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -D -m0644 README  "${pkgdir}/usr/share/doc/${pkgname}/README"
    rm -f "${pkgdir}"/usr/lib/*.la
}

sha1sums=("4d0d0c153ec74ce3584d393440a3d344342581ad")
