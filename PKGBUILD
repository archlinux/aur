# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=hpp-constraints
pkgver=3.2
pkgrel=1
pkgdesc="Definition of basic geometric constraints for motion planning"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('LGPL3')
depends=('hpp-model')
optdepends=()
makedepends=('cmake')
source=("https://github.com/humanoid-path-planner/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('044c5f20da37f6cc2ccd903fb29a6dc5')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DUSE_QPOASES=FALSE .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
