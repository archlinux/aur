pkgname=kms-cmake-utils
pkgver=6.17.0
pkgrel=1
pkgdesc="Helpers for cmake build of Kurento media server"
arch=(any)
url="https://github.com/Kurento/kms-cmake-utils"
license=(apache)
source=("git+https://github.com/Kurento/$pkgname.git#tag=$pkgver")
sha256sums=(SKIP)

build() {
    local builddir=$srcdir/$pkgname/build
    rm -rf "$builddir"
    mkdir "$builddir"
    cd "$builddir"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_MODULES_INSTALL_DIR=share/cmake/Modules ..
    make
}

package() {
    local builddir=$srcdir/$pkgname/build
    cd "$builddir"
    make install DESTDIR="$pkgdir"
}
