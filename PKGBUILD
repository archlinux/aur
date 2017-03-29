# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=pinocchio
pkgver=1.2.3
pkgrel=2
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://stack-of-tasks.github.io/pinocchio/"
license=('LGPL3')
depends=('eigen32' 'hpp-fcl' 'eigenpy' 'urdfdom')
optdepends=('metapod-git' 'lua51')
makedepends=('cmake')
source=("https://github.com/stack-of-tasks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('d505f8b8c15354fd29dd19d54e1112fb')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_CXX_FLAGS=-std=c++03 .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
