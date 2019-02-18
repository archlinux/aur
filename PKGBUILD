# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>
pkgbase=linux-firmware-surface
pkgname=(
  linux-firmware-surface-pro-3
  linux-firmware-surface-pro-4
  linux-firmware-surface-pro-2017
  linux-firmware-surface-pro-6
  linux-firmware-surface-studio
  linux-firmware-surface-laptop
  linux-firmware-surface-laptop-2
  linux-firmware-surface-book
  linux-firmware-surface-book-2
  linux-firmware-surface-book-2-1793
  linux-firmware-surface-go
)
pkgver=20190216.9f6f687dd
pkgrel=1
pkgdesc="Firmware files for Microsoft Surface devices, from https://github.com/jakeday/linux-surface/"
makedepends=('git')
arch=('any')
url="https://github.com/jakeday/linux-surface/"
license=('custom')
options=(!strip)
source=("git+https://github.com/jakeday/linux-surface.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/"
}

pkgver() {
  cd "${srcdir}/linux-surface"

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

package_linux-firmware-surface-common() {
  install -d "${pkgdir}/usr/lib/firmware/mrvl"
  unzip -o "${srcdir}/linux-surface/firmware/mrvl_firmware.zip" -d "${pkgdir}/usr/lib/firmware/mrvl/"
  install -d "${pkgdir}/usr/lib/firmware/mwlwifi"
  unzip -o "${srcdir}/linux-surface/firmware/mwlwifi_firmware.zip" -d "${pkgdir}/usr/lib/firmware/mwlwifi/"
}

package_linux-firmware-surface-pro-3() {
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_bxt.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-pro-4() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v78.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_skl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-pro-2017() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v102.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-pro-6() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v102.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-studio() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v76.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_skl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-laptop() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v79.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-laptop-2() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v79.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-book() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v76.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_skl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-book-2() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v137.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gp108"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gp108.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gp108/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gv100"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gv100.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gv100/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-book-2-1793() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v101.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gp108"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gp108.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gp108/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gv100"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gv100.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gv100/"
  package_linux-firmware-surface-common
}

package_linux-firmware-surface-go() {
  install -d "${pkgdir}/usr/lib/firmware/intel/ath10k"
  unzip -o "${srcdir}/linux-surface/firmware/ath10k_firmware.zip" -d "${pkgdir}/usr/lib/firmware/intel/ath10k/"
  package_linux-firmware-surface-common
}
