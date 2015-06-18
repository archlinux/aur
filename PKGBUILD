# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@autistici.org>

pkgname=kamerka
pkgver=0.10
pkgdesc="Take photos using your webcam and shiny animated QML interface (KDE4 app)"
pkgrel=2
epoch=1
arch=('i686' 'x86_64')
url="http://dos1.github.io/kamerka/"
license=('GPL')
makedepends=('cmake' 'automoc4')
depends=('kdelibs' 'qt4' 'v4l-utils' 'qimageblitz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dos1/kamerka/archive/${pkgver}.tar.gz")
sha256sums=('8331021ab5420362f32803bae7329449a756f4839993305a1271390de3ef4df8')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
