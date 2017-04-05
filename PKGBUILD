# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=hpp-model
pkgver=3.2
pkgrel=1
pkgdesc="Implementation of kinematic chains with geometry"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('LGPL3')
depends=('eigen32' 'hpp-util-git' 'hpp-fcl')
optdepends=('assimp')
makedepends=('cmake')
source=("https://github.com/humanoid-path-planner/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('428325210d9ab77c4730f458eb55bfe1')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
