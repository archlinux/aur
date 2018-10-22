# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=hpp-fcl
pkgver=0.6.0
pkgrel=1
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('BSD 3-clause')
depends=('eigen' 'assimp')
makedepends=('cmake')
source=("http://www.openrobots.org/distfiles/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('95f189b2d79154c9fa76ba8bc3edb109')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
