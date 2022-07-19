# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pipectl
pkgver=0.4.0
pkgrel=1
pkgdesc="a simple named pipe management utility"
url="https://github.com/Ferdi265/pipectl"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
makedepends=('cmake' 'scdoc')
source=(
    "pipectl-$pkgver.tar.gz::https://github.com/Ferdi265/pipectl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('6fa585c666d779c638ddba90f2340c0a070532137c1a84ae1a0ce0080f7f1b52')

build() {
    cmake -B build -S "$srcdir/pipectl-$pkgver" \
        -DINSTALL_DOCUMENTATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_MANDIR=/usr/share/man
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
