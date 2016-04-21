# Contributor: Len Zhang <zyldragoon@gmail.com>

pkgname=appmenu-qt
pkgver=0.2.6
pkgrel=3
pkgdesc="Add support for application menu to Qt"
arch=('i686' 'x86_64')
url="https://launchpad.net/appmenu-qt"
license=('GPL')
depends=('libdbusmenu-qt')
makedepends=('cmake')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('90cce750e5412d43ce075b0a9bdb6782')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE="Release"
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
