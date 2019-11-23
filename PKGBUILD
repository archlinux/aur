# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=ksmoothdock
pkgver=5.15
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=('x86_64')
url='https://github.com/dangvd/ksmoothdock'
license=('GPL3')
depends=('kactivities' 'kxmlgui')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('13baafc00e81eb6d8ffd65c6ccf84817064a0f8cfefcdd100a6ffb0323bffdaf')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake src \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
}
