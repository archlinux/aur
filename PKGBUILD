# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Lorenz Steinert <lorenz@steinerts.de>

pkgname=h5cpp
pkgver=0.4.1
pkgrel=1
pkgdesc="h5cpp is a C++ wrapper for HDF5s C-API."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="h5cpp.org"
license=('GPL2')
depends=('boost-libs' 'hdf5')
optdepends=()
makedepends=('cmake' 'boost')
source=("https://github.com/ess-dmsc/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dd0833619fc9ef615829cfcbfaeca0694f27b3c1ca573633ee103e4c7aa92ebb')

build() {
    cd $srcdir/$pkgname-$pkgver

    mkdir -p build
    cd build
    cmake -DCONAN=DISABLE -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/build
    make DESTDIR="$pkgdir"  install
}
