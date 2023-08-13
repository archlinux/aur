# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal
pkgver=0.4.0
pkgrel=1
pkgdesc="LMDB Abstraction Layer, qt5 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' 'qt5-base')
makedepends=('cmake>=3.16')
optdepends=()

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/blue/lmdbal/archive/$pkgver.tar.gz")
sha256sums=('2356335c944eb9e1126cc83d6545fc0d378f18cd39fa749cca347d54327d5d35')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=5
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}
