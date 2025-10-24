# Maintainer: Jan Samek <samekh@email.cz>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Loekaars <?>

pkgname=sigrok-firmware-saleae-logic
pkgver=1.2.10
pkgrel=2
pkgdesc="Firmware and FPGA bitstream binaries for Saleae Logic (Pro) devices used with Sigrok."
arch=(any)
url="https://support.saleae.com/logic-software/legacy-software/older-software-releases"
license=(custom)
makedepends=(python)
conflicts=(sigrok-firmware-saleae-logic16)
source=(
    "git+https://github.com/sigrokproject/sigrok-util#commit=249b79d0a94e"
    "http://downloads.saleae.com/logic/${pkgver}/Logic+${pkgver}+(64-bit).zip")
md5sums=('SKIP'
         '4a621715c73cba3237ae72c04647c53f')

package() {
  mkdir -p "$pkgdir/usr/share/sigrok-firmware"
  cd "$pkgdir/usr/share/sigrok-firmware"

  "$srcdir/sigrok-util/firmware/saleae-logic16/sigrok-fwextract-saleae-logic16" "$srcdir/Logic ${pkgver} (64-bit)/Logic"
}
