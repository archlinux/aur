# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=35770
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=2ea3c170da96f2878a571bf59a10bfd5bef2ddc21ae359117b479e5fbd8d5d30
_i915=9bf0339d69751821373bc9f52640a09d2bf4e84351377ea30b2472cad6ec9cc7
source=("35770-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/35770/Manifest.linux-firmware"
        "35770-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/35770/files/2ea3c170da96f2878a571bf59a10bfd5bef2ddc21ae359117b479e5fbd8d5d30.tar"
        "35770-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/35770/files/9bf0339d69751821373bc9f52640a09d2bf4e84351377ea30b2472cad6ec9cc7.tar")
sha256sums=("2dd91a1a0823250e738071e816640ae996f0e6843a3abda5a5f746f8fe0023aa"
            "3dcf3620ed3e34b46890c6f0a919779c51ef94e9d04f067d8332107f52a1fd4c"
            "6e60e08c9704429b79eeb9c85ceec0c95cec06adadddd4f25b6082153a1b1b5a")

build() {
  mv "2ea3c170da96f2878a571bf59a10bfd5bef2ddc21ae359117b479e5fbd8d5d30" intel-ucode.cpio
  mv "9bf0339d69751821373bc9f52640a09d2bf4e84351377ea30b2472cad6ec9cc7" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
