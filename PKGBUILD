# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20240000.7
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('GPL2')
depends=('gcc-libs')
optdepends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b3cdc7e18fe3cb2bd427be4abb264c3c58bbb3bd5f88a4244a92c34f893dbab7')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
}
