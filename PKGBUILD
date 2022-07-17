# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=36610
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=6a28f5743ae36a7fa2510b9a7a3563f1b06cbc80e64ab68e8891ac4d064aae2d
_i915=b1b4a7aa78c572fae88785780538001026cfd7c1c8711284130dee1742f116b4
source=("36610-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/36610/Manifest.linux-firmware"
        "36610-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/36610/files/6a28f5743ae36a7fa2510b9a7a3563f1b06cbc80e64ab68e8891ac4d064aae2d.tar"
        "36610-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/36610/files/b1b4a7aa78c572fae88785780538001026cfd7c1c8711284130dee1742f116b4.tar")
sha256sums=("73c2a019bcc6291f8218ea9024f5bff6aede37c7fcd0d6e4e810618e90f77f31"
            "e17a41addd6af7c7ad72f0c47592788f601aad139e3153403ddb9f8a85a88bd0"
            "0a3f3e6c87e7e8323c6cd20a20136781a8ccb859d06a149823f12d60d028ecef")

build() {
  mv "6a28f5743ae36a7fa2510b9a7a3563f1b06cbc80e64ab68e8891ac4d064aae2d" intel-ucode.cpio
  mv "b1b4a7aa78c572fae88785780538001026cfd7c1c8711284130dee1742f116b4" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
