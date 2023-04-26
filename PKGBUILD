# Maintainer: lod <aur@cyber-anlage.de>

pkgname=yasdi
pkgver=1.8.3
pkgrel=1
pkgdesc="An implementation of the SMA Data Protocols, through which our inverters communicate with other SMA devices."
arch=('x86_64')
url="https://www.sma.de/en/products/apps-software/yasdi"
license=('GPL2')
depends=('glibc')
makedepends=('git' 'cmake')
source=("git+https://github.com/konstantinblaesi/yasdi.git#tag=v$pkgver")
sha256sums=('SKIP')
options=(!debug)

build() {
    cd $pkgname
    
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../sdk/projects/generic-cmake
    make
}

package() {
    cd $pkgname/build
    
    make DESTDIR=$pkgdir/ install
}

