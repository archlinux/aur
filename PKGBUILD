# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=34950
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=ab902f053c1462e92579ef4e0d438b99f49c2b5028cc2b048828f3a7108c8d55
_i915=308ed4a7941bd531b602507fbbbff6a5e55bd9b96519eefa99c704db074a886d
source=("34950-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/34950/Manifest.linux-firmware"
        "34950-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/34950/files/ab902f053c1462e92579ef4e0d438b99f49c2b5028cc2b048828f3a7108c8d55.tar"
        "34950-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/34950/files/308ed4a7941bd531b602507fbbbff6a5e55bd9b96519eefa99c704db074a886d.tar")
sha256sums=("0866ef2b1e5bfe7692be48e3422c4426c2a22a9d04fa8419102ff8ff5826b71d"
            "3ceecde70165d02981c89b80f67094b9f5a173e5e60815b93e31dc401713f77b"
            "5cf10e486430b46149d6e742648363307a4987d2808cd657404b3ad0d2b8489e")

build() {
  mv "ab902f053c1462e92579ef4e0d438b99f49c2b5028cc2b048828f3a7108c8d55" intel-ucode.cpio
  mv "308ed4a7941bd531b602507fbbbff6a5e55bd9b96519eefa99c704db074a886d" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
