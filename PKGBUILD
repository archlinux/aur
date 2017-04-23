# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=dnscrypt-proxy-gui
pkgver=1.6.8
pkgrel=1
pkgdesc='Qt/KF5 GUI wrapper over dnscrypt-proxy'
arch=('i686' 'x86_64')
url='https://github.com/F1ash/dnscrypt-proxy-gui'
license=('GPL')
depends=('plasma-framework' 'plasma-desktop' 'dnscrypt-proxy' 'systemd')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('dnscrypt-proxy-gui-git')
source=("https://github.com/F1ash/dnscrypt-proxy-gui/archive/1.6.8.tar.gz")
sha256sums=('SKIP')


build() {
  cd "$srcdir"/dnscrypt-proxy-gui-$pkgver

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSHARE_INSTALL_PREFIX=/usr/share \
   
    
  make
}

package() {
  cd "$srcdir"/dnscrypt-proxy-gui-$pkgver/build

  make DESTDIR="$pkgdir" install
}

