# Maintainer: Szymon Scholz
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=startactive
pkgver=0.4
pkgrel=1
pkgdesc="A dependency-based init system for KDE workspace"
arch=('i686' 'x86_64')
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
source=("http://download.kde.org/stable/active/4.0/src/${pkgname}-${pkgver}.tar.xz")

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
md5sums=('94e1b93ce6c843dc1ce1d0b8301de357')
