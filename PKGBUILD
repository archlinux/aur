# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=36220
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=6a5758d3529113c6f221bff55c3bf51dbcd367a1173cc8ecef5bc3fb25e03d8d
_i915=7f08bef9ba0d8a2fde4717e1afc958a62e958add5245e0b94a360834a6bb7617
source=("36220-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/36220/Manifest.linux-firmware"
        "36220-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/36220/files/6a5758d3529113c6f221bff55c3bf51dbcd367a1173cc8ecef5bc3fb25e03d8d.tar"
        "36220-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/36220/files/7f08bef9ba0d8a2fde4717e1afc958a62e958add5245e0b94a360834a6bb7617.tar")
sha256sums=("6fbf3b23d97619973a468ab2e3c1193398f89b1d9c9b1799c28ff5b49c94c846"
            "5d90d6f45a19abc965794d3771312ee1535011df432f5c0bc6f13c15237c1c56"
            "3019142daafdfad606ae877e7605500ee3635d336957e2b85c7af5d775c47ad1")

build() {
  mv "6a5758d3529113c6f221bff55c3bf51dbcd367a1173cc8ecef5bc3fb25e03d8d" intel-ucode.cpio
  mv "7f08bef9ba0d8a2fde4717e1afc958a62e958add5245e0b94a360834a6bb7617" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
