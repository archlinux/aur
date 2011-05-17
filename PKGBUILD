# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=unarchiver
pkgver=2.7.1
pkgrel=1
pkgdesc="An Objective-C application for uncompressing archive files"
arch=('x86_64' 'i686')
url="http://wakaba.c3.cx/s/apps/unarchiver.html"
license=('LGPL2.1')
depends=('gnustep-base' 'openssl' 'bzip2' 'icu' 'gcc-libs' 'zlib')
makedepends=('gcc-objc')
source=("http://theunarchiver.googlecode.com/files/TheUnarchiver${pkgver}_src.zip")
sha1sums=('dba7a5aee159435a7ad6d1879443ab66a809c970')

build() {
  cd "$srcdir/The Unarchiver/XADMaster"
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile.linux
}

package() {
  cd "$srcdir/The Unarchiver/XADMaster"
  install -d "$pkgdir/usr/bin/"
  install -m755 unar lsar "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
