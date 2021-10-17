# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=35140
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=bc47f2af60b233283139cb601cb1a99e0918ce25d3512025848feb111f06051a
_i915=3ad47d963e7d1975559f954d867203c2c1c762bd0d3afd2d82cb0de4269c5efa
source=("35140-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/35140/Manifest.linux-firmware"
        "35140-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/35140/files/bc47f2af60b233283139cb601cb1a99e0918ce25d3512025848feb111f06051a.tar"
        "35140-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/35140/files/3ad47d963e7d1975559f954d867203c2c1c762bd0d3afd2d82cb0de4269c5efa.tar")
sha256sums=("d8d67dedde5ae311d149212f4d33667c9dc38b83d593e328dac19b08a944b02a"
            "4682130b3c3eb1228250ed05cf39578e16037a6edb9d33dc4f82f926b903ef4b"
            "f08e953a2fef92ba5e9d88296c8db14236cc3a1bcbc2b9e66df58272a042e115")

build() {
  mv "bc47f2af60b233283139cb601cb1a99e0918ce25d3512025848feb111f06051a" intel-ucode.cpio
  mv "3ad47d963e7d1975559f954d867203c2c1c762bd0d3afd2d82cb0de4269c5efa" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
