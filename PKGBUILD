# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=dnscrypt-proxy-gui
pkgver=1.10.9
pkgrel=1
pkgdesc='Qt/KF5 GUI wrapper over dnscrypt-proxy'
arch=('i686' 'x86_64')
url='https://github.com/F1ash/dnscrypt-proxy-gui'
license=('GPL2')
depends=('qt5-base' 'kauth' 'knotifications' 'polkit' 'hicolor-icon-theme' 'dnscrypt-proxy' 'systemd')
makedepends=('cmake' 'extra-cmake-modules' 'desktop-file-utils')
conflicts=('dnscrypt-proxy-gui-git')
source=("https://github.com/F1ash/dnscrypt-proxy-gui/archive/1.10.9.tar.gz")
sha256sums=('351dcafad77134af7a898cbee92eb73a52232cc3bc107ef4f165f629c1450928')


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

