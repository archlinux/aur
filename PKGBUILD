# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=hpp-fcl
pkgver=0.5
pkgrel=2
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('BSD 3-clause')
depends=('eigen32' 'assimp')
makedepends=('cmake')
source=("https://github.com/humanoid-path-planner/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('e872800a18086367ff3eb18a5beae6a4')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
