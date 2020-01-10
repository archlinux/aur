# Maintainer: Jan Samek <samekh@email.cz>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=sigrok-firmware-saleae-logic
pkgver=1.2.10
pkgrel=1
pkgdesc="Firmware and FPGA bitstream binaries for Saleae Logic (Pro) devices used with Sigrok."
arch=(any)
url="https://support.saleae.com/logic-software/legacy-software/older-software-releases"
license=(custom)
makedepends=(python)
conflicts=(sigrok-firmware-saleae-logic16)
source=(
    "git://sigrok.org/sigrok-util"
    "http://downloads.saleae.com/logic/${pkgver}/Logic+${pkgver}+(64-bit).zip"
    "https://trello-attachments.s3.amazonaws.com/55f0a61a10f9f592573a4205/5697d62ba03bdba21581dc15/429ff3e09adc4067ec9984092759897d/License.txt")
md5sums=('SKIP'
         '4a621715c73cba3237ae72c04647c53f'
         '58d2dcb368ef3586f50f2333ac89e5ff')

package() {
  mkdir -p "$pkgdir/usr/share/sigrok-firmware"
  cd "$pkgdir/usr/share/sigrok-firmware"

  "$srcdir/sigrok-util/firmware/saleae-logic16/sigrok-fwextract-saleae-logic16" "$srcdir/Logic ${pkgver} (64-bit)/Logic"

  install -Dm 644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
