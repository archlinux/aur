# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=bootcommander
pkgver=1.14.01
pkgrel=1
pkgdesc="BootCommander is a CLI program for performing firmware updates on a microcontroller that runs the OpenBLT bootloader."
arch=(x86_64)
url="https://www.feaser.com/openblt/doku.php?id=manual:bootcommander"
license=('GPL')
depends=('libopenblt')
makedepends=('cmake')
source=("$pkgname-$pkgver.zip::https://nav.dl.sourceforge.net/project/openblt/OpenBLT%20stable/version%20${pkgver}/openblt_v0${pkgver//.}.zip")
md5sums=('c222da15b773f41e130c5761ac87b461')

build() {
  cd "openblt_v0${pkgver//.}/Host/Source/BootCommander/build"

  cmake ..
  make
}

package() {
  cd "openblt_v0${pkgver//.}/Host"

  install -D "BootCommander"	  "$pkgdir/usr/bin/BootCommander"
  ln -sf "/usr/bin/BootCommander" "$pkgdir/usr/bin/bootcommander"
}
