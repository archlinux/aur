# Contributor: Mark Richardson <echo@mit.edu>
# Maintainer: Olivier Mehani <shtrom+aur@ssji.net>

pkgname=librfid-dpavlin-git
_realname=librfid
pkgver=0.2.0
pkgrel=1
depends=('libusb')
pkgdesc="This library intends to provide a reader and (as much as possible) PICC / tag independent API for RFID applications."
arch=(i686 x86_64)
url="http://openmrtd.org/projects/librfid/"
license=('GPL')
groups=('base')
provides=('librfid=0.2.0')
#conflicts=('librfid')
options=(!libtool)
source=(git+https://github.com/dpavlin/librfid)
md5sums=('SKIP')

prepare() {
  cd $srcdir/$_realname
  autoreconf -i
  }

build() {
  cd $srcdir/$_realname
  autoreconf -i
  ./configure --prefix=/usr --disable-build-docs
  make
}

package() {
  cd $srcdir/$_realname
  make DESTDIR=$pkgdir install
}
