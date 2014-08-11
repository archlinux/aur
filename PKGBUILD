# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=libxvnc
_pkgname=libXvnc
pkgver=1.1
pkgrel=1
pkgdesc="X11 extention protocol library for the VNC extension"
arch=('i686' 'x86_64')
license=('GPL')
url=("https://github.com/bbidulock/libxvnc")
makedepends=('vncproto')
depends=('libxext')
source=("https://github.com/bbidulock/libxvnc/releases/download/libxvnc-1.1/libXvnc-1.1.tar.bz2")
md5sums=('949ed624250c66f035e5e93cab06e7fc')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
