# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pipectl
pkgver=0.2.2
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
sha256sums=('725850ed0866987e7922a9886c0dfc5cabf53ec0989d08e089d6e4edddec5907')

build() {
    cmake -B build -S "$srcdir/pipectl-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
