# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=dnscrypt-proxy-gui
pkgver=1.9.8
pkgrel=1
pkgdesc='Qt/KF5 GUI wrapper over dnscrypt-proxy'
arch=('i686' 'x86_64')
url='https://github.com/F1ash/dnscrypt-proxy-gui'
license=('GPL2')
depends=('qt5-base' 'kauth' 'knotifications' 'polkit' 'hicolor-icon-theme' 'dnscrypt-proxy' 'systemd')
makedepends=('cmake' 'extra-cmake-modules' 'desktop-file-utils')
conflicts=('dnscrypt-proxy-gui-git')
source=("https://github.com/F1ash/dnscrypt-proxy-gui/archive/1.9.8.tar.gz")
sha256sums=('971dedb3b40f1e8efe09ddc336ff47da8f52c01296e6204f59cd1156d565f40a')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSHARE_INSTALL_PREFIX=/usr/share \
   
    
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
}

