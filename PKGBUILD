# Maintainer: danitool

pkgname=okteta-legacy
pkgver=4.14.3
pkgrel=1
pkgdesc='Hex Editor. Version before kf5'
url='http://kde.org/applications/utilities/okteta/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdesdk')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
conflicts=('kdesdk-okteta' 'okteta' 'okteta-git')
install=${pkgname}.install
source=("http://download.kde.org/stable/${pkgver}/src/okteta-${pkgver}.tar.xz")
sha1sums=('479779119ef5dd5cea2b2acf1f134b355dffe74d')

build() {
 mkdir build
 cd build
 cmake ../okteta-${pkgver} \
 -DCMAKE_BUILD_TYPE=Release \
 -DKDE4_BUILD_TESTS=OFF \
 -DCMAKE_INSTALL_PREFIX=/usr
 make
}

package() {
 cd build
 make DESTDIR=$pkgdir install
}
