# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-firmware
pkgver=12.10.1.36
pkgrel=1
pkgdesc="Additional firmware files for the ASUS MeMO Pad 7 (ME176C/CX)"
arch=(x86_64)
url="https://github.com/me176c-dev/me176c-archlinux"
license=('unknown')
options=('!strip')
source=("http://dlcdnet.asus.com/pub/ASUS/EeePAD/ME176C/UL-K013-WW-$pkgver-user.zip")
sha256sums=('b19a2901bd5920b58bd3693243a9edf433656bcee8f454637ee401e28c096469')

package() {
    # WiFi NVRAM file
    install -Dm644 system/etc/nvram.txt "$pkgdir/usr/lib/firmware/brcm/brcmfmac43362-sdio.txt"

    # Bluetooth firmware
    install -Dm644 system/etc/firmware/BCM2076B1_002.002.004.0132.0141_reduced_2dB.hcd \
        "$pkgdir/usr/lib/firmware/brcm/BCM.hcd"
}
