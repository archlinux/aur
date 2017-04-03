# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=eigenpy
pkgver=1.3.2
pkgrel=5
pkgdesc="Bindings between numpy and eigen using boost::python for eigen 3.2"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/eigenpy"
license=('LGPL3')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen32' 'boost' 'python2-numpy')
source=("https://github.com/stack-of-tasks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('a57eff7bb2f7551c9ebc712dd4d6549f')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
