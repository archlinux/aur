# Maintainer: banbanchs <memory.silentvoyage[at]gmail.com>
# Contributor: Alexander Kazarin <boiler[at]co.ru>
pkgname=showimage
pkgver=1.10.1
_pkgver=1.10
pkgrel=1
pkgdesc="ShowImage is a simple KDE based image viewer using the maximum space inside its window without cluttering the window with menubar, toolbar or statusbar."
_odid=143977
url="http://opendesktop.org/content/show.php/ShowImage?content=${_odid}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdelibs')
makedepends=('cmake' 'extra-cmake-modules' 'automoc4' 'libkexiv2')
optdepends=()
source=(https://dl.opendesktop.org/api/files/download/id/1482097460/${pkgname}-${_pkgver}.tar.bz2)
sha256sums=('a9c11b1eb7ba6bf9d85c19a2630bb323a7a1657ce704953faa7837a71c20d9ff')

build() {
  cd ${srcdir}/${pkgname}-${_pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
