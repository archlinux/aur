# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20190200.1
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('any')
url="https://github.com/$pkgorg/$_pkgname"
license=('GPL2')
depends=()
optdepends=()
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('0951cfdf6b1ec4c525f1df61b535057a859c1faf580cfef71cb3170b02cfcb21')

build() {
    cd "$_pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
