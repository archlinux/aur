# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=libdbusmenu-qt
pkgname=libdbusmenu-qt4
pkgver=0.9.3+16.04.20160218
pkgrel=1
pkgdesc="A library that provides a Qt4 implementation of the DBusMenu spec"
arch=(x86_64)
url="https://launchpad.net/libdbusmenu-qt"
license=(GPL)
conflicts=(libdbusmenu-qt)
provides=(libdbusmenu-qt)
replaces=(libdbusmenu-qt)
depends=(qt4)
makedepends=(cmake doxygen qjson qt4)
source=("http://archive.ubuntu.com/ubuntu/pool/main/libd/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('a8e6358a31c44ccdf1bfc46c95a77a6bfc7fc1f536aadb913ed4f4405c570cf6')

prepare() {
  mkdir -p ${srcdir}/build
}

build() {
  cd ${srcdir}/build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_QT4=On
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
