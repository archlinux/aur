# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=35060
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=bc47f2af60b233283139cb601cb1a99e0918ce25d3512025848feb111f06051a
_i915=3ad47d963e7d1975559f954d867203c2c1c762bd0d3afd2d82cb0de4269c5efa
source=("35060-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/35060/Manifest.linux-firmware"
        "35060-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/35060/files/bc47f2af60b233283139cb601cb1a99e0918ce25d3512025848feb111f06051a.tar"
        "35060-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/35060/files/3ad47d963e7d1975559f954d867203c2c1c762bd0d3afd2d82cb0de4269c5efa.tar")
sha256sums=("37f6a76f6d75072415627344e70334031c654819258a7c7af075db5899cfca20"
            "6f51f9d92790e77533b4a97948187b839e3c0a27b8790adb205eb345c41dddd5"
            "8c4460f7aae784e124cbff7f856e0b3740fee4edee0ac0e06ae3592798ced9c0")

build() {
  mv "bc47f2af60b233283139cb601cb1a99e0918ce25d3512025848feb111f06051a" intel-ucode.cpio
  mv "3ad47d963e7d1975559f954d867203c2c1c762bd0d3afd2d82cb0de4269c5efa" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
