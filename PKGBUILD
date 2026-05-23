# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20260000.0
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('GPL2')
depends=('gcc-libs')
optdepends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('41ec617bb1e4163da381aaa5083a152e033631e9b5e135ccdc3466aaa1dc9001')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
}
