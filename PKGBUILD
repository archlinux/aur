# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=36290
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=ade492c2fbb0b0882ea1c602e7190e160319d6063cf274482331c68209ced97a
_i915=195bef89bbb8f71873326ab3ff2537393447f79d639e3b7565e049faf30dd9da
source=("36290-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/36290/Manifest.linux-firmware"
        "36290-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/36290/files/ade492c2fbb0b0882ea1c602e7190e160319d6063cf274482331c68209ced97a.tar"
        "36290-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/36290/files/195bef89bbb8f71873326ab3ff2537393447f79d639e3b7565e049faf30dd9da.tar")
sha256sums=("99a5716ebb2cf91def14437ca5b6b3c497df6447084ef2e1ecb36efe35cfdf46"
            "b9c72934a87caa65777217d098643b7f742c303044a4938279c77a9c0cd61042"
            "ac78aac52ff0daeaa9028f8d6ef8298ac1c83ff290527a1e109085ef66148cd5")

build() {
  mv "ade492c2fbb0b0882ea1c602e7190e160319d6063cf274482331c68209ced97a" intel-ucode.cpio
  mv "195bef89bbb8f71873326ab3ff2537393447f79d639e3b7565e049faf30dd9da" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
