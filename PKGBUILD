# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@autistici.org>

pkgname=kamerka
pkgver=0.20
pkgdesc="Take photos using your webcam and shiny animated QML interface"
pkgrel=2
epoch=1
arch=('i686' 'x86_64')
url="http://dos1.github.io/kamerka/"
license=('GPL')
makedepends=('cmake')
depends=('kdeclarative' 'qt5-base' 'kdelibs4support' 'kwidgetsaddons' 'phonon-qt5' 'kio' 'kcoreaddons' 'kconfig' 'ki18n' 'knotifications' 'qt5-declarative' 'qt5-script' 'v4l-utils' 'qimageblitz' 'kdesignerplugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dos1/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a87612851fba9222f6454aaa08694f1ae5a2483a708198a761262789fd246467')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release ..
  make
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
