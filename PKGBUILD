# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=sigrok-firmware-saleae-logic16
pkgver=0
pkgrel=1
pkgdesc="FX2 firmware and the FPGA bitstreams required for using the Saleae Logic16."
arch=(any)
url="http://sigrok.org/wiki/Saleae_Logic16#Firmware"
license=(custom)
makedepends=(python)
source=(
    "git://sigrok.org/sigrok-util"
    "http://downloads.saleae.com/Logic%201.1.15%20(64-bit).zip"
    "https://trello-attachments.s3.amazonaws.com/55f0a61a10f9f592573a4205/5697d62ba03bdba21581dc15/429ff3e09adc4067ec9984092759897d/License.txt")
md5sums=(
    "SKIP"
    "a5074f4bf198ebb95b6e08309b207a88"
    "58d2dcb368ef3586f50f2333ac89e5ff")

package() {
  mkdir -p "$pkgdir/usr/share/sigrok-firmware"
  cd "$pkgdir/usr/share/sigrok-firmware"

  "$srcdir/sigrok-util/firmware/saleae-logic16/sigrok-fwextract-saleae-logic16" "$srcdir/Logic 1.1.15 (64-bit)/Logic"

  install -Dm 644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
