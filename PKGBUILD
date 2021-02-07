# Maintainer: levinit
# Co-Maintainer: robertfoster

pkgname=edk2-avmf
pkgver=20200801
pkgrel=4
fedora_ver=34
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
  "https://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/e/edk2-aarch64-${pkgver}stable-${pkgrel}.fc${fedora_ver}.noarch.rpm"
  "https://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/e/edk2-arm-${pkgver}stable-${pkgrel}.fc${fedora_ver}.noarch.rpm")

sha256sums=('a801b428c5b2136f6ed01cdf211bea622ed7f896670c601d7a54f869c8b43a66'
  'd344aa3125f17e82aaa7eb4bc2b9cb01193264dbd1b1c416a802867d106ad84e')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}
