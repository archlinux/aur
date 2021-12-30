# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pipectl
pkgver=0.2.0
pkgrel=1
pkgdesc="a simple named pipe management utility"
url="https://github.com/Ferdi265/pipectl"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
makedepends=('git' 'cmake')
source=(
    "pipectl-$pkgver.tar.gz::https://github.com/Ferdi265/pipectl/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('b56bbc7a8cdd5266193410fd369fbd57a22a71383b90e6ec233cfd6f6fe3259a')

build() {
    cmake -B build -S "$srcdir/pipectl-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
