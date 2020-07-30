# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the24
pkgver=1.0
pkgrel=0
pkgdesc="Clock app"
arch=("x86_64")
url="https://github.com/vicr123/the24"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'phonon-qt5'  'qt5-base' 'taglib' 'the-libs' 'qt5-svg')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/the24/archive/v1.0.tar.gz")
sha256sums=('12c9c76fbc9f32e3811faf4ee1ef26ac65c637152de63e594d70f55321d2f1c8')
sha256sums=('SKIP')

build() {
    cd "the24-$pkgver"

    mkdir build
    cd build
    
    qmake ../the24.pro
    make
}

package() {
	cd "the24-$pkgver/build"
	make install INSTALL_ROOT=$pkgdir
}
