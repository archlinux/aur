# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=dnscrypt-proxy-gui
pkgver=1.11.15
pkgrel=1
pkgdesc='Qt/KF5 GUI wrapper over dnscrypt-proxy'
arch=('i686' 'x86_64')
url='https://github.com/F1ash/dnscrypt-proxy-gui'
license=('GPL2')
depends=('kauth' 'knotifications' 'hicolor-icon-theme' 'dnscrypt-proxy')
makedepends=('cmake' 'extra-cmake-modules' 'desktop-file-utils')
conflicts=('dnscrypt-proxy-gui-git')
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1a3a32f252cd6146d40c9835d6878a4279427de23dbcc89f69ce89aaab52bbdf')


build() {
  cd ${pkgname}-${pkgver}

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSHARE_INSTALL_PREFIX=/usr/share \
   
    
  make
}

package() {
  cd ${pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir} install
}

