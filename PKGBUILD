# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=unarchiver
pkgver=2.7
pkgrel=1
pkgdesc="An Objective-C application for uncompressing archive files"
arch=('x86_64' 'i686')
url="http://wakaba.c3.cx/s/apps/unarchiver.html"
license=('LGPL')
depends=('gnustep-base' 'openssl' 'bzip2' 'icu' 'gcc-libs' 'zlib')
makedepends=('gcc-objc')
source=(http://theunarchiver.googlecode.com/files/TheUnarchiver"$pkgver"_src.zip)
md5sums=('c6aed2fcb2b68d86a9d9d4fc39c4ea41')

build() {
  cd "$srcdir/The Unarchiver/XADMaster"

  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile.linux
}

package() {
  cd "$srcdir/The Unarchiver/XADMaster"
  install -d "$pkgdir/usr/bin/"
  cp unar lsar "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
