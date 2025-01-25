# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20250000.2
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('GPL2')
depends=('gcc-libs')
optdepends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d6688c7530913dfd286f7db71b007fd96df10a9e8b43ad74539e4450c9917ebf')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
}
