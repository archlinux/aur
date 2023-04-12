# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=lmdbal
pkgver=0.3.0
pkgrel=1
pkgdesc="LMDB Abstraction Layer, qt5 version"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/lmdbal"
license=('GPL3')
depends=( 'lmdb' 'qt5-base')
makedepends=('cmake>=3.16')
optdepends=()

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/blue/lmdbal/archive/$pkgver.tar.gz")
sha256sums=('df1a9687d81d609d160754285f2613d7e07fc6deb781d0fb0084e4857ea82e95')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D QT_VERSION_MAJOR=5
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}
