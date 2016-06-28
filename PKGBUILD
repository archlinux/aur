# Maintainer: Grego Dadone <GregoD at archlinux.org>
# Contributor: Andrea Scarpino <andrea at archlinux.org>

pkgname=amor
pkgver=15.08.3
pkgrel=1
pkgdesc='On-Screen Creature'
url='https://projects.kde.org/projects/kde/kdetoys/amor'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=("http://download.kde.org/stable/applications/${pkgver}/src/amor-${pkgver}.tar.xz")
sha1sums=('d8e4550e987a6df59abf75f22df99b3fab1e8ed3')

build() {
  mkdir -p build
  cd build
  cmake ../amor-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}