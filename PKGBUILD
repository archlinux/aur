# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal-qt6
pkgver=0.6.2
pkgrel=1
pkgdesc="LMDB Abstraction Layer, qt6 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' qt6-base )
makedepends=('cmake>=3.16' 'gcc')
optdepends=()

source=("lmdbal-$pkgver-$pkgrel.tar.gz::https://git.macaw.me/blue/lmdbal/archive/$pkgver.tar.gz")
sha256sums=('1fcc92fe030794cffe5b1d18c8d7845bab9369dee83f640e862aa060a0a68d1d')
build() {
        cd "$srcdir/lmdbal"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -DQT_VERSION_MAJOR=6 -DLMDBAL_NAME=LMDBALQT6
        cmake --build .
}
package() {
        cd "$srcdir/lmdbal"
        DESTDIR="$pkgdir/" cmake --install .
}
