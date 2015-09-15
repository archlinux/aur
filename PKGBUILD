# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=libsaasound
pkgver=3.2
pkgrel=2
pkgdesc="Philips SAA1099 sound generator chip emulator"
arch=('i686' 'x86_64')
url="http://www.simcoupe.org/"
license=('GPL')
depends=('sdl')
makedepends=('make')
source=("http://www.simcoupe.org/files/SAASound-${pkgver}.tar.gz")

build() {
  cd "$srcdir/SAASound-${pkgver}"
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  install -m755 -d $pkgdir/usr/lib/{include,lib}

  cd "$srcdir/SAASound-${pkgver}"
  make install
}

md5sums=('6a1e45f3f8958be6cfe88872cec3763f')

# vim:set sts=2 ts=2 sw=2 et:
