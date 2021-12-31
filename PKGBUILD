# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pipectl
pkgver=0.2.1
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
sha256sums=('af0e0bf626c44007158ba3cd96cf9f2ed3e38231bf59224090f22fd9cb9cc259')

build() {
    cmake -B build -S "$srcdir/pipectl-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
