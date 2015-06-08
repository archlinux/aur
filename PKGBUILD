# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=startactive
pkgver=0.3
pkgrel=1
pkgdesc="A dependency-based init system for KDE workspace"
arch=('i686' 'x86_64')
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
source=("http://download.kde.org/stable/active/3.0/src/${pkgname}-${pkgver}.tar.xz")
md5sums=('fc06ee1e7caeed2f3a6ac41ac7796ce6')

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}
