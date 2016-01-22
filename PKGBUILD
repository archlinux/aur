# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=sunxi-tools
pkgver=1.3
pkgrel=1
pkgdesc="Tools to help hacking Allwinner A10 devices."
arch=('i686' 'x86_64')
url="https://github.com/linux-sunxi/sunxi-tools"
license=('GPL')
depends=(libusb)
makedepends=(libusb)
source=(https://github.com/linux-sunxi/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('2aa0afc21476ee9b03acff20a19f32c522106e61bcbfa1a9463168fe90a85fc5')


build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -d $pkgdir/usr/bin
  install -Dm755 -t $pkgdir/usr/bin sunxi-fexc sunxi-bootinfo sunxi-fel sunxi-nand-part fex2bin bin2fex
}
