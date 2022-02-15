# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=bit-babbler
pkgver=0.9
pkgrel=2
pkgdesc='Read entropy from BitBabbler hardware RNG devices'
arch=('i686' 'x86_64')
url='http://www.bitbabbler.org'
license=('GPL2')
depends=('libusb>=1.0')
optdepends=('munin: monitoring support')
# source=("${url}/downloads/${pkgname}_${pkgver}.tar.gz"
#         "${url}/downloads/${pkgname}_${pkgver}.tar.gz.asc")
source=("https://mirrors.edge.kernel.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('d85eb56288f71587313f25066342784e2c8eb70cc2a1945772bd0fe596b4c0c0')
validpgpkeys=('8EAF735424339DDDFE835628125831AE66E70556') # BitBabbler Support <support@bitbabbler.org>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
