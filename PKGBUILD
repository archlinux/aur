# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=pam_usermount
pkgver=0.1
pkgrel=1
pkgdesc="PAM module for automounting (encrypted) volumes on login"
arch=('i686' 'x86_64')
url="https://github.com/irtimmer/pam_usermount"
license=('GPL')
depends=('cryptsetup')
makedepends=('cmake')
source=("https://github.com/irtimmer/pam_usermount/archive/v$pkgver.tar.gz")
sha256sums=('a68d5e47d1853a821e15c70b1cc6235cf02844e67c645df4dd3a24806e0c6557')

build() {
  mkdir -p build
  cd build
  cmake ../pam_usermount-$pkgver -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
