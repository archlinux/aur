# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal-qt6
pkgver=0.6.0
pkgrel=4
pkgdesc="LMDB Abstraction Layer, qt6 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' qt6-base )
makedepends=('cmake>=3.16' 'gcc')
optdepends=()

source=("lmdbal-$pkgver-$pkgrel.tar.gz::https://git.macaw.me/blue/lmdbal/archive/$pkgver.tar.gz")
sha256sums=('485ac618384b42d84677f0c2896067599b34bd65fc4fc8fa30b39c6005572fd7')
build() {
        cd "$srcdir/lmdbal"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=6 -D LMDBAL_NAME=LMDBALQT6
        cmake --build .
}
package() {
        cd "$srcdir/lmdbal"
        DESTDIR="$pkgdir/" cmake --install .
}
