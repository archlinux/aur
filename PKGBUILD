# Maintainer: kevku <kevku@gmx.com>
pkgname=qesteidutil
pkgver=3.12.5.1233
pkgrel=1
pkgdesc="UI application for managing smart card PIN/PUK codes and certificates"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('qt5-base' 'ccid' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('b5f0361af1891cfab6f9113d6b2fab677cc4772fc18b62df7d6e997f13b97857')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}

