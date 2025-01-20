# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20250000.1
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('GPL2')
depends=('gcc-libs')
optdepends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bc45eed630c1ebac3dc07ffc542eee6edf0a9fc1e94a1012a26f1fb56b5b588b')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
}
