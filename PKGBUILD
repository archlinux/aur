# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal-qt6
pkgver=0.5.4
pkgrel=2
pkgdesc="LMDB Abstraction Layer, qt6 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' qt6-base )
makedepends=('cmake>=3.16' 'gcc')
optdepends=()

source=("lmdbal-$pkgver.tar.gz::https://git.macaw.me/blue/lmdbal/archive/$pkgver.tar.gz")
sha256sums=('f06078577db896d4a08164ded3cb1c4f5f7beb4e524a32b194040f8fd9a33594')
build() {
        cd "$srcdir/lmdbal"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=6 -D LMDBAL_NAME=LMDBAL-QT5
        cmake --build .
}
package() {
        cd "$srcdir/lmdbal"
        DESTDIR="$pkgdir/" cmake --install .
}
