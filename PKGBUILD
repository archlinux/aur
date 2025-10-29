# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal-qt5
pkgver=0.6.1
pkgrel=1
pkgdesc="LMDB Abstraction Layer, qt5 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' qt5-base )
makedepends=('cmake>=3.16' 'gcc')
optdepends=()

source=("lmdbal-$pkgver-$pkgrel.tar.gz::https://git.macaw.me/blue/lmdbal/archive/$pkgver.tar.gz")
sha256sums=('5dfab35d4d9ca6b4611bcc531bb83b83d545681b2680d44428738e8ce490b705')
build() {
        cd "$srcdir/lmdbal"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=5 -D LMDBAL_NAME=LMDBALQT5
        cmake --build .
}
package() {
        cd "$srcdir/lmdbal"
        DESTDIR="$pkgdir/" cmake --install .
}
