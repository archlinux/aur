# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=ksmoothdock
pkgver=5.10
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=('i686' 'x86_64')
url='https://github.com/dangvd/ksmoothdock'
license=('GPL3')
depends=('kxmlgui')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('debb6f00ee2462406d48bb8a4e255454edd91a0f7758e01d6625a97b9f5de54b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake src \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
}
