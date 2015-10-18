# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=simcoupe
pkgver=1.0
pkgrel=2
pkgdesc="The SAM Coupé Emulator"
arch=('i686' 'x86_64')
url="http://www.simcoupe.org/"
license=('GPL')
depends=('sdl' 'libsaasound')
makedepends=('make' 'imagemagick')
source=("http://www.simcoupe.org/files/SimCoupe-${pkgver}.tar.gz"
    "simcoupe.desktop")

build() {
  cd "$srcdir/SimCoupe/SDL"
  make
  convert SimCoupe.bmp simcoupe.png
}

package() {
  install -m755 -d $pkgdir/usr/{bin,share/applications,share/pixmaps}

  cd "$srcdir/SimCoupe/SDL"
  
  install -D -m644 ../../simcoupe.desktop $pkgdir/usr/share/applications
  install -D -m644 simcoupe.png $pkgdir/usr/share/pixmaps
  install -D -m755 simcoupe $pkgdir/usr/bin
}

md5sums=('2931e93b877af0a383a4db9424c456f8'
    'bd4dbdecfccb1eb86dfc9a23309bf5b9')

# vim:set sts=2 ts=2 sw=2 et:
