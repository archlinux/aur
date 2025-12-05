# Maintainer: Amini Allight <amini dot allight at protonmail dot com>

pkgname=npdfr
pkgver=0.3.5
pkgrel=1
pkgdesc='A command-line PDF reader prioritizing fast searches'
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/amini-allight/npdfr/'
license=('GPL3')
depends=('libmupdf' 'ncurses')
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/amini-allight/npdfr.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd npdfr
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make -j$(nproc)
}

package() {
    cd npdfr/build
    make DESTDIR="$pkgdir/" install
}
