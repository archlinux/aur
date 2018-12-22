# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20180000.0
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('any')
url="https://github.com/$pkgorg/$_pkgname"
license=('GPL2')
depends=()
optdepends=()
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha1sums=('962308a5ea77254f7af8f6b50ab6807dfe6d1122')

build() {
    cd "$_pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
