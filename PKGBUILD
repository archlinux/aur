# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=rockpix-ap6255
pkgver=1.0
pkgrel=1
pkgdesc="WiFi & BT Firmware patch for ROCK PI X"
arch=('x86_64')
provides=('firmware-rockpix')
url="https://wiki.radxa.com/RockpiX/downloads"
license=('custom')
depends=(
	'linux-firmware'
)
source=("https://dl.radxa.com/rockpix/drivers/firmware/AP6255_BT_WIFI_Firmware.zip")
sha256sums=('1b9434fcdd361b778effe4b510b84e717e3ece7589cfaec55ec8944ef9836003')

package() {
  install -dDm755 "$pkgdir"/usr/lib/firmware/brcm
  cd "$srcdir"/BT_WIFI_Firmware/bt
  install BCM4345C0.hcd "$pkgdir"/usr/lib/firmware/brcm/BCM4345C0.hcd
  cd "$srcdir"/BT_WIFI_Firmware/wifi
  install "brcmfmac43455-sdio.ROCK Pi-ROCK Pi X.txt" "$pkgdir"/usr/lib/firmware/brcm/"brcmfmac43455-sdio.Radxa-ROCK Pi X.txt"
  install "brcmfmac43455-sdio.ROCK Pi-ROCK Pi X.txt" "$pkgdir"/usr/lib/firmware/brcm/brcmfmac43455-sdio.txt
  install brcmfmac43455c0-sdio.bin "$pkgdir"/usr/lib/firmware/brcm/brcmfmac43455-sdio
  install brcmfmac43455c0-sdio.bin "$pkgdir"/usr/lib/firmware/brcm/brcmfmac43455c0-sdio.bin
}
