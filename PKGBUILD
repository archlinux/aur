# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=nixio
pkgver=1.4.3
pkgrel=1
pkgdesc='Neuroscience information exchange format'
arch=('x86_64')
url='http://g-node.github.io/nix/'
license=('BSD')
depends=('hdf5' 'boost')
makedepends=('cmake')
conflicts=('nixio-git')
sha512sums=('b019e51636e4331ce4438289dbd00b350ef42e9046f4df2c66d8acf294b57c73da1bdc9b1bbf91476aaefe20a193c5e9e29f1551deb387f7c66b105b4908590a')
source=("https://github.com/G-Node/nix/archive/${pkgver}.tar.gz")

build() {
    cd "nix-${pkgver}"

    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make
}

package() {
    cd "nix-${pkgver}/build"
    make DESTDIR="${pkgdir}/" install
}
