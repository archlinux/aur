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

sha256sums=('cc53f1c5f809b7e1a2f17d5cd715eb151b64131e55737c8a8e2bbf5dbd8f873e'
            '12eb760d4aa09f07307705a4118e7c2a719d7427a4889c2bfbfc971bf8e3314f')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}
