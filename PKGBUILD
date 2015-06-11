# Maintainer: Frikilinux <frikilinux at gmail.com>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kde-thumbnailer-apk
pkgver=1.0
pkgrel=3
pkgdesc="Preview image generator plugin for Android Application Package files."                                                                                      
arch=('i686' 'x86_64')                                                                       
url="http://kde-apps.org/content/show.php/KDE+APK+Thumbnailer?content=156421"                                                  
license=('GPL')                                                    
depends=('kdelibs')
makedepends=('cmake' 'automoc4')                                                             
source=(http://kde-apps.org/CONTENT/content-files/156421-${pkgname}-${pkgver}.tar.bz2)
install=${pkgname}.install
sha256sums=('aefb7296a5207e13c4f3624acb6fd3ea359972fbee7f618686f970036067f476')

build() {
  cd "${srcdir}"/${pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DAutomoc4_DIR=/usr/lib/automoc4
  make
}
package() {
  cd "${srcdir}"/${pkgname}
  make DESTDIR="${pkgdir}" install
}
