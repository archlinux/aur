# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Origin Maintainer: Megumifox <i@megumifox.com>

pkgname=firmware-phicomm-n1
pkgver=7
pkgrel=7
pkgdesc="Additional firmware for Phicomm N1"
arch=('any')
conflicts=('firmware-raspberrypi')
depends=('wireless-regdb' 'uboot-tools')
install=${pkgname}.install
url="https://github.com/RPi-Distro"
license=('custom')
_commitid_wl=f713a6054746bc61ece1c8696dce91a7b7e22dd9
_commitid_bt=8445a53ce2c51a77472b908a0c8f6f8e1fa5c37a
_ver="${pkgver}.${pkgrel}"
options=('!strip')
source=("brcmfmac43455-sdio_$_ver.clm_blob::https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/$_commitid_wl/brcm/brcmfmac43455-sdio.clm_blob"
        "brcmfmac43455-sdio_$_ver.txt::https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/$_commitid_wl/brcm/brcmfmac43455-sdio.txt"
        "brcmfmac43455-sdio_$_ver.bin::https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/$_commitid_wl/brcm/brcmfmac43455-sdio.bin"
        "BCM4345C0_$_ver.hcd::https://raw.githubusercontent.com/RPi-Distro/bluez-firmware/$_commitid_bt/broadcom/BCM4345C0.hcd")
sha256sums=('2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a'
            'ca709be81a78bdb6932936374f39943acbd7af07fae6151011127599a3ce9e3d'
            'cf79e8e8727d103a94cd243f1d98770fa29f5da25df251d0d31b3696f3b4ac6a'
            'c723c903655086c9f3a1de94a291f495a0f087f1ee6d3ee7bc4c558497aae7bc')

package() {
  install -d "${pkgdir}/usr/lib/firmware/updates/brcm"
  install -m 0644 brcmfmac43455-sdio_$_ver.clm_blob "${pkgdir}/usr/lib/firmware/updates/brcm/brcmfmac43455-sdio.clm_blob"
  install -m 0644 brcmfmac43455-sdio_$_ver.txt "${pkgdir}/usr/lib/firmware/updates/brcm/brcmfmac43455-sdio.txt"
  install -m 0644 brcmfmac43455-sdio_$_ver.bin "${pkgdir}/usr/lib/firmware/updates/brcm/brcmfmac43455-sdio.bin"
  install -m 0644 BCM4345C0_$_ver.hcd "${pkgdir}/usr/lib/firmware/updates/brcm/BCM4345C0.hcd"

  install -m 0644 brcmfmac43455-sdio_$_ver.txt "${pkgdir}/usr/lib/firmware/updates/brcm/brcmfmac43455-sdio.phicomm,n1.txt"
}

