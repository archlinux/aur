# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=eigenpy
pkgver=1.3.0
pkgrel=3
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/eigenpy"
license=('LGPL3 or any later version')
depends=('eigen' 'boost-libs' 'python2-numpy')
makedepends=('cmake')
source=("https://github.com/stack-of-tasks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('6946ae23a2b96b3885c32255151a6e0b')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
