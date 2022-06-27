# Maintainer: levinit
# Co-Maintainers: robertfoster, stafwag, Solskogen

pkgname=edk2-avmf
pkgver=20220526git16779ede2d36
pkgrel=1
fedora_ver=37
fedora_rel=3
pkgdesc="QEMU ARM/AARCH64 Virtual Machine Firmware (Tianocore UEFI firmware)."
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('BSD')

optdepends=(
  "qemu: To make use of edk2 ovmf firmware"
  "qemu-arch-extra: QEMU for foreign architectures"
  "virt-manager: Desktop user interface for managing virtual machines"
)

source=(
  "https://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/e/edk2-aarch64-${pkgver}-${fedora_rel}.fc${fedora_ver}.noarch.rpm"
  "https://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/e/edk2-arm-${pkgver}-${fedora_rel}.fc${fedora_ver}.noarch.rpm")

sha256sums=('a2932f0e2bb22d401fba53315d46148d970d55a62a0ff4931870ae35420f01b7'
            '17d8c812d3ededb7adc5c1c688359516b2ebdf7746df2de802f06adb8f0f12fc')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}

