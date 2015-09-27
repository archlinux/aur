# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=libsoundio
pkgver=1.0.2
pkgrel=1
pkgdesc="A C99 library providing cross-platform audio input and output"
arch=('x86_64')
url='http://www.github.com/andrewrk/libsoundio'
license=('MIT')
source=("https://github.com/andrewrk/${pkgname}/archive/${pkgver}.tar.gz")
options=('!buildflags')
md5sums=('d5376029d8304e1c3bd038fa1cf46ff4')

build() {
    cd ${srcdir}
    mkdir -p build
    cd build
    cmake \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR=lib \
        -D ENABLE_JACK=OFF \
        ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    make -C ${srcdir}/build install DESTDIR=${pkgdir}
}
