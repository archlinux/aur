# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=eigenpy
pkgver=1.3.3
pkgrel=1
pkgdesc="Bindings between numpy and eigen using boost::python for eigen 3.2"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/eigenpy"
license=('LGPL3')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen32' 'boost' 'python2-numpy')
source=("https://github.com/stack-of-tasks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('4b946e2b667814e3ee6d18b913c1266f')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
