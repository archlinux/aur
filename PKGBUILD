# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pipectl
pkgver=0.4.1
pkgrel=2
pkgdesc="a simple named pipe management utility"
url="https://github.com/Ferdi265/pipectl"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
makedepends=('cmake' 'ninja' 'scdoc')
source=(
    "pipectl-$pkgver.tar.gz::https://github.com/Ferdi265/pipectl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('d7b04d6a08f0f1cd61e62de52006902aac3b3254002712c19f71dffe0bf379c7')

build() {
    cmake -G Ninja -B build -S "$srcdir/pipectl-$pkgver" \
        -DINSTALL_DOCUMENTATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
