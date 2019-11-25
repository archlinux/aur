# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=ksmoothdock
pkgver=6.1
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=('x86_64')
url='https://github.com/dangvd/ksmoothdock'
license=('GPL3')
depends=('kactivities' 'kxmlgui')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('377c56867cd14279a87cedacf933ba8cb6c8f89664337c73edfc8f62e33503ea')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake src \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
}
