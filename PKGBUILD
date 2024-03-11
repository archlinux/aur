# Maintainer: bill-auger <bill-auger@programmer.net>


pkgname=64tass
pkgver=1.59.3120
pkgrel=1
pkgdesc="cross-assembler targeting MOS 65xx micro processors (6502, 65C02, R65C02, W65C02, 65CE02, 65816, DTV, 65EL02, 4510)"

url=https://tass64.sourceforge.net/
arch=('armv7h' 'i686' 'x86_64')
license=('GPL2')

source=(https://sourceforge.net/projects/tass64/files/source/${pkgname}-${pkgver}-src.zip)
sha256sums=('a89a7b79ad234c6ea51a1c9d6c472d0f3827d01b2501b3f30cd0af9541423eef')


build()
{
  cd "${srcdir}"/${pkgname}-${pkgver}-src

  make
}

package()
{
  cd "${srcdir}"/${pkgname}-${pkgver}-src

  make prefix=/usr DESTDIR="${pkgdir}" install
}
