# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=pinocchio
pkgver=1.2.4
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://stack-of-tasks.github.io/pinocchio/"
license=('LGPL3')
depends=('eigen32' 'hpp-fcl' 'eigenpy' 'urdfdom')
optdepends=('metapod-git' 'lua51')
makedepends=('cmake')
source=("https://github.com/stack-of-tasks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('5415e1514a899905f0357bf8ef6ac69f')

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
