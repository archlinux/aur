# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: dirty_d <andrew2085 at gmail dot com>

pkgname=joyutils
pkgver=1.2.15
pkgrel=6
pkgdesc='jscal, jstest, and jsattach utilities for the linux joystick driver'
arch=('x86_64' 'i686')
url='http://atrey.karlin.mff.cuni.cz/~vojtech/joystick/'
license=('GPL')
makedepends=('addinclude')
source=("ftp://atrey.karlin.mff.cuni.cz/pub/linux/joystick/joystick-$pkgver.tar.gz")
sha256sums=('532b3ad453824e7932c6b68b59c3a20b8c40f45c13c343d3cb109ca08296716d')

build() {
  cd "joystick-$pkgver"

  addinclude jscal.c stdlib
  gcc -lm -o jscal jscal.c ${CFLAGS}
  gcc -o jstest jstest.c ${CFLAGS}
  gcc -o jsattach jsattach.c ${CFLAGS}
}
  
package() {
  cd "joystick-$pkgver"

  install -Dm 755 jscal "$pkgdir/usr/bin/jscal"
  install -m 755 jstest "$pkgdir/usr/bin/"
  install -m 755 jsattach "$pkgdir/usr/bin/"
  install -Dm 644 jscal.1 "$pkgdir/usr/share/man/man1/jscal.1"
  install -m 644 jstest.1 "$pkgdir/usr/share/man/man1/"
  install -m 644 jsattach.1 "$pkgdir/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
