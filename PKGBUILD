# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal-qt6
pkgver=0.5.4
pkgrel=1
pkgdesc="LMDB Abstraction Layer, qt6 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' qt6-base )
makedepends=('cmake>=3.16' 'gcc')
optdepends=()

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/blue/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d4edf38cf77cdb981c775efc139b7a958f55f7a0e549103a2eea7d8399768855')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=6
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}
