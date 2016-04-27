# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=ring-kde
pkgver=2.3.0
pkgrel=2
pkgdesc="KDE client for Ring"
arch=("i686" "x86_64")
url="http://ring.cx/"
license=("GPL3")
groups=("ring")
depends=("libringclient" "knotifyconfig" "hicolor-icon-theme")
makedepends=("git" "extra-cmake-modules" "python" "glu" "kinit")
source=("git://anongit.kde.org/${pkgname}#commit=4c39a138be4352a6a0409806110630045aa14f49")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"

    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
    cd "${pkgname}/build"

    make DESTDIR="${pkgdir}" install
}

