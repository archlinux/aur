# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@autistici.org>

pkgname=kamerka
pkgver=0.12
pkgdesc="Take photos using your webcam and shiny animated QML interface (KDE4 app)"
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url="http://dos1.github.io/kamerka/"
license=('GPL')
makedepends=('cmake' 'automoc4')
depends=('kdelibs' 'qt4' 'v4l-utils' 'qimageblitz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dos1/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8390a98476b34b658a0b5d4a26875ec3a76aeece64782b2dde2e32175d8a88d6')

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
