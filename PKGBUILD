# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=ksmoothdock
pkgver=5.11
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=('i686' 'x86_64')
url='https://github.com/dangvd/ksmoothdock'
license=('GPL3')
depends=('kxmlgui')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3c064848dba4ad7892cdb98cf39265e68314ca4e7f5d53597d67e8597af2e94c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake src \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
}
