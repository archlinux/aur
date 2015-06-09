# Maintainer: Eric Biggers <ebiggers3@gmail.com>
pkgname=libdivsufsort
pkgver=2.0.1
pkgrel=1
pkgdesc="A fast and lightweight C library to construct the suffix array and the Burrows-Wheeler transformed string for any input string of a constant-size alphabet."
arch=("i686" "x86_64")
url="https://code.google.com/p/${pkgname}/"
license=("BSD")
makedepends=("cmake")
source=("https://libdivsufsort.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")

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

sha1sums=("9a4af93d36724c0136eccbc5317a61b19323656e")
