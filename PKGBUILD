# Maintainer: Maik Wramba <ma.wramba@gmail.com>

pkgname=cvsba
pkgver=1.0.0
pkgrel=1
pkgdesc='OpenCV wrapper for the sba sparse bundle adjustment library'
arch=('i686' 'x86_64')
url='http://www.uco.es/investiga/grupos/ava/node/39/'
license=('GPL2')

depends=('opencv'
         'lapack'
         'f2c')
makedepends=('cmake>=2.8.0')

source=("https://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('1feb689cd87e27c442e63e85763941567a1718b9b89b7acfb6dc496a5bb04c86')

build() {
    cd "$pkgname-$pkgver"
    mkdir build
    cd build
    cmake ../
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
