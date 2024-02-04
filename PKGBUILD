# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal
pkgver=0.5.4
pkgrel=1
pkgdesc="LMDB Abstraction Layer, qt5 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' 'qt5-base')
makedepends=('cmake>=3.16' 'gcc')
optdepends=()

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/blue/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ca2a09d7e162923c0209b8c88c4d3996f1f4972de813dbe28a108c0d4734b77a')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=5
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}
