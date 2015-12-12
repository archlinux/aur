# $Id: PKGBUILD 252860 2015-12-06 17:01:28Z bpiotrowski $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=polkit-kde
pkgver=0.99.0
pkgrel=6
pkgdesc='Daemon providing a polkit authentication UI for KDE'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/polkit-kde-agent-1'
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/apps/KDE4.x/admin/${pkgname}-agent-1-${pkgver}.tar.bz2")
md5sums=('a02d3fddc6270a88bceaf3ba604c92f8')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${pkgname}-agent-1-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
