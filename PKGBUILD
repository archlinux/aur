# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgname=doxygen-yap
pkgver=1.9.8
pkgrel=1
pkgdesc='Doxygen for Prolog'
arch=(x86_64)
url=https://github.com/vscosta/doxygen-yap
license=(GPL-2.0-only)
makedepends=(cmake)
source=(git+https://github.com/vscosta/doxygen-yap.git#commit=444ea3d68aa7d8b551f16d14af04a40907099e7d)
sha256sums=(SKIP)
provides=(doxygen)

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
    mv "$pkgdir/usr/bin/doxygen" "$pkgdir/usr/bin/doxygen-yap"
}
