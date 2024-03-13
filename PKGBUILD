# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20240000.4
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('GPL2')
depends=('gcc-libs')
optdepends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0dfc1e30b32d5dd3086ee3adb6d2746a019e9d670b644c4d5ec1df3c35dd1fe5')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
}
