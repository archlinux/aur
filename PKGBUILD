# Maintainer: Denis Demidov <dennis.demidov@gmail.com>

pkgname=vexcl-git
pkgver=20170418
pkgrel=5
pkgdesc='a C++ vector expression template library for OpenCL/CUDA'
arch=('i686' 'x86_64')
url='http://github.com/ddemidov/vexcl'
license=('MIT')
depends=('boost-libs')
conflicts=('vexcl')
provides=('vexcl')
makedepends=('git' 'cmake' 'boost' 'opencl-headers')
source=(git+https://github.com/ddemidov/vexcl.git)
md5sums=('SKIP')

build() {
    cd "${srcdir}/vexcl"
    ls
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/vexcl/build"
    DESTDIR=${pkgdir} make install
}
