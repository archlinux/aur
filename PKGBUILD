# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=flash-bio
pkgver=1.2.11
pkgrel=2
pkgdesc='An accurate and fast tool to merge paired-end DNA reads'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib')
url="https://sourceforge.net/projects/flashpage/"
source=("https://downloads.sourceforge.net/project/flashpage/FLASH-${pkgver}.tar.gz")
sha256sums=('685ca6f7fedda07434d8ee03c536f4763385671c4509c5bb48beb3055fd236ac')

build() {
  cd FLASH-${pkgver}
  make
}

package() {
  cd FLASH-${pkgver}
  install -Dm755 flash ${pkgdir}/usr/bin/flash
  install -Dm644 README ${pkgdir}/usr/share/doc/FLASH/README
  install -Dm644 NEWS ${pkgdir}/usr/share/doc/FLASH/NEWS
}
