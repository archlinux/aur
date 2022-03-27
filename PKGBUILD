# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=36020
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=34565cf70d46998bf92bf2c70a93154c736ee0388e27cb33b0d85176eccdfd15
_i915=675f90366b35a3bed3a89b371d97fff28464c70dfcdc9395593f0afd32453212
source=("36020-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/36020/Manifest.linux-firmware"
        "36020-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/36020/files/34565cf70d46998bf92bf2c70a93154c736ee0388e27cb33b0d85176eccdfd15.tar"
        "36020-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/36020/files/675f90366b35a3bed3a89b371d97fff28464c70dfcdc9395593f0afd32453212.tar")
sha256sums=("711b4639fd8dcdae96e28a699273355d5d78a6645736acc620684115f913cb0e"
            "ead1bed8e71de71e709b1de72fef0774722934784a789d091d93f609f1f8659f"
            "a2c6c211b143efbeafc1de22887faec104028e36263d8cdb10eb346c336bcc77")

build() {
  mv "34565cf70d46998bf92bf2c70a93154c736ee0388e27cb33b0d85176eccdfd15" intel-ucode.cpio
  mv "675f90366b35a3bed3a89b371d97fff28464c70dfcdc9395593f0afd32453212" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
