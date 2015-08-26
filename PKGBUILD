# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=qmapshack
pkgver=1.3.0
pkgrel=1
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://bitbucket.org/maproom/qmapshack/'
license=('GPL3+')
depends=('gdal')
makedepends=('cmake' 'make')
source=("https://bitbucket.org/maproom/qmapshack/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('f1d16bf227108edd6219341ea1352d1d')

build() {
    cd "$pkgname-$pkgver"

    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="${pkgdir}" install
}
