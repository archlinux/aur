# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=dell-venue-8-pro-5830-wifi-firmware
pkgver=1
pkgrel=1
pkgdesc="Firmware for the AR6004 WiFi controller in Dell Venue 8 Pro (5830 series) tablets"
arch=('any')
license=('custom')
source=("https://downloads.dell.com/FOLDER04119992M/1/5830_Network_Driver_FG0HG_WN32_3.7.2.63715_A06.EXE"
        "https://github.com/qca/ath6kl-firmware/raw/2e02576c1dab6fd35118eea1004f50aaaed3794f/ath6k/AR6004/hw3.0/fw-5.bin")
sha256sums=("f5c6be179509d12b119ea171502fb6dabc391a88c4e3bf7812c7461d94147a8f"
            "c2ea9b6fcadccd268fd8838f68a9cff80a6020f1dd60095a3a59bd8f437445f1")

package() {
  install -Dm 644 \
    drivers/production/Windows8.1-x86/WLAN-Driver/boardDatav3_0.bin \
    "${pkgdir}/usr/lib/firmware/ath6k/AR6004/hw3.0/bdata.bin"
  install -Dm 644 \
    fw-5.bin \
    "${pkgdir}/usr/lib/firmware/ath6k/AR6004/hw3.0/fw-5.bin"
}
