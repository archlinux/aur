# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=35910
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=66350ab6d07324fa85285978053b4c27af57fb854b14e677216af720c7127a6b
_i915=51b75270cdd930cc657e7b01f544f249c885deaf04103cb7ed743819e16fa1b9
source=("35910-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/35910/Manifest.linux-firmware"
        "35910-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/35910/files/66350ab6d07324fa85285978053b4c27af57fb854b14e677216af720c7127a6b.tar"
        "35910-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/35910/files/51b75270cdd930cc657e7b01f544f249c885deaf04103cb7ed743819e16fa1b9.tar")
sha256sums=("8b603aa52ce2f95075e6113110657bd49c0a581669c67497f8dff2f889ee7ced"
            "6bb888e33be241afcb7f1f6b4a69f129c10ae8f298904d92f0534103a802799e"
            "84a5f8f1e612461737721dec1f5b852ae6fde6965ae997962f8dbd59af0c2afb")

build() {
  mv "66350ab6d07324fa85285978053b4c27af57fb854b14e677216af720c7127a6b" intel-ucode.cpio
  mv "51b75270cdd930cc657e7b01f544f249c885deaf04103cb7ed743819e16fa1b9" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
