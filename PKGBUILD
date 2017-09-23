# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=eigenpy
pkgver=1.3.3
pkgrel=2
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/eigenpy"
license=('LGPL3')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python2-numpy')
source=("https://github.com/stack-of-tasks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('70a18a2e3b35bd41a5d06f866c516e32')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
