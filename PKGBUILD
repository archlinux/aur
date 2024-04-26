# Maintainer: Amini Allight <amini dot allight at protonmail dot com>

pkgname=optench
pkgver=1.2.5
pkgrel=1
pkgdesc='A virtual optical bench written in C++ with Qt'
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://gitlab.com/amini-allight/optench/'
license=('GPL3')
depends=('qt6-base')
makedepends=('git' 'cmake' 'make')
source=("git+https://gitlab.com/amini-allight/optench.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd optench
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make -j$(nproc)
}

package() {
    cd optench/build
    make DESTDIR="$pkgdir/" install
}
