# Maintainer: banbanchs <memory.silentvoyage[at]gmail.com>
# Contributor: Alexander Kazarin <boiler[at]co.ru>
pkgname=showimage
pkgver=1.9.1
_pkgver=1.9
pkgrel=1
pkgdesc="ShowImage is a simple KDE based image viewer using the maximum space inside its window without cluttering the window with menubar, toolbar or statusbar."
_odid=143977
url="http://opendesktop.org/content/show.php/ShowImage?content=${_odid}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
optdepends=()
source=(http://opendesktop.org/CONTENT/content-files/${_odid}-${pkgname}-${_pkgver}.tar.bz2)
sha256sums=('be21dd3d46be4347601187a7533449d72bc13b75c5346355b274c33a0b9eea61')

build() {
  cd ${srcdir}/${pkgname}-${_pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
