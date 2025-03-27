# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgname=linux-firmware-brcm43752
pkgver=0.0.0
pkgrel=1
pkgdesc='Firmware for the SparkLan AP6275S'
url='https://source.puri.sm/Librem5/firmware-brcm43752-nonfree'
arch=('any')
license=('custom')
makedepends=(git)
options=(
  !strip
  !debug
)

source=('git+https://source.puri.sm/Librem5/firmware-brcm43752-nonfree.git#commit=4fff6ff76fa69b5b3d9d234e8df953ccbbf39fa9')
b2sums=('5b2b6b65b1f69a1dd6b1b2bd3b6fde5c688d9e26901633a0d23e78f5e6f23c38ac32e5a80b821cb37d95e13ce88759330dc17adba0e44de776d9150126880577')

package() {
    cd "$srcdir/firmware-brcm43752-nonfree"

    # Bluetooth
    install -Dm644 -t "$pkgdir/usr/lib/firmware/brcm" "firmware/brcm/BCM4362A2.hcd"

    # Wi-Fi
    install -Dm644 -t "$pkgdir/usr/lib/firmware/brcm" "firmware/brcm/brcmfmac43752-sdio.bin"
    install -Dm644 -t "$pkgdir/usr/lib/firmware/brcm" "firmware/brcm/brcmfmac43752-sdio.clm_blob"
    install -Dm644 -t "$pkgdir/usr/lib/firmware/brcm" "firmware/brcm/brcmfmac43752-sdio.txt"

    ln -s "brcmfmac43752-sdio.bin" "$pkgdir/usr/lib/firmware/brcm/brcmfmac43752-sdio.purism,librem5r2.bin"
    ln -s "brcmfmac43752-sdio.bin" "$pkgdir/usr/lib/firmware/brcm/brcmfmac43752-sdio.purism,librem5r3.bin"
    ln -s "brcmfmac43752-sdio.bin" "$pkgdir/usr/lib/firmware/brcm/brcmfmac43752-sdio.purism,librem5r4.bin"
}
