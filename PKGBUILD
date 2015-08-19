# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=sunxi-tools
pkgver=1.2
pkgrel=1
pkgdesc="Tools to help hacking Allwinner A10 devices."
arch=('i686' 'x86_64')
url="https://github.com/linux-sunxi/sunxi-tools"
license=('GPL')
depends=(libusb)
makedepends=(libusb)
source=(https://github.com/linux-sunxi/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('86c1f2ace861a320b90bf5962a45329120ddc903cf0df678f1d31a44d6ba6b6e')


build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -d $pkgdir/usr/bin
  install -Dm755 -t $pkgdir/usr/bin fexc bootinfo fel nand-part usb-boot
  cd $pkgdir/usr/bin
  ln -s fexc bin2fex
  ln -s fexc fex2bin
}
