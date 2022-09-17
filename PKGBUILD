# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=libsaasound
pkgver=3.4
pkgrel=1
pkgdesc="Philips SAA1099 sound generator chip emulator"
arch=('i686' 'x86_64')
url="http://www.simcoupe.org/"
license=('GPL')
depends=('sdl')
makedepends=('make')
source=("https://github.com/simonowen/SAASound/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('784340694e9d75f1364643a54d12eb7c')

build() {
  cd "$srcdir/SAASound-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  make
}

package() {
  install -m755 -d $pkgdir/usr/{include,lib}

  cd "$srcdir/SAASound-${pkgver}"
  make install
}

# vim:set sts=2 ts=2 sw=2 et:
