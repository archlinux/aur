# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal-qt5
pkgver=0.5.4
pkgrel=3
pkgdesc="LMDB Abstraction Layer, qt5 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' qt5-base )
makedepends=('cmake>=3.16' 'gcc')
optdepends=()

source=("lmdbal-$pkgver.tar.gz::https://git.macaw.me/blue/lmdbal/archive/$pkgver.tar.gz")
sha256sums=('62704a64949fa2a088f1846ff8d1066be52360683e204c340e08051ddcfd6aae')
build() {
        cd "$srcdir/lmdbal"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=5 -D LMDBAL_NAME=LMDBAL-QT5
        cmake --build .
}
package() {
        cd "$srcdir/lmdbal"
        DESTDIR="$pkgdir/" cmake --install .
}
