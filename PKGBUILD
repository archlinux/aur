# Maintainer: Martin Minka <martin dot minka at gmail dot com>
# Author: Benjamin Tissoires <benjamin.tissoi...@gmail.com> 
pkgname=pairing_tool
pkgver=20110922
pkgrel=2
pkgdesc="Tool to pair Logitech devices to unifying receiver"
arch=('i686' 'x86_64')
url="https://goo.gl/eG4q9"
license=('GPL')
source=(pairing_tool.c README)
depends=(glibc)
md5sums=('ca0db9898ac03facd732ba12b3ec9751'
         'ab0f29754cce4d627babad9ddbc4b0e4')

build() {
  cd "${srcdir}"
  gcc -o pairing_tool pairing_tool.c
  
}

package() {
  cd "${srcdir}"
  mkdir -p $pkgdir/usr/bin/
  cp ./pairing_tool $pkgdir/usr/bin/
  chmod 775 $pkgdir/usr/bin/pairing_tool
}

