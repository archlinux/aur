# Maintainer: levinit
# Co-Maintainers: robertfoster, stafwag, Solskogen

pkgname=edk2-avmf
pkgver=20220826gitba0e0e4c6a17
pkgrel=1
fedora_ver=38
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
  "https://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/e/edk2-aarch64-${pkgver}-${pkgrel}.fc${fedora_ver}.noarch.rpm"
  "https://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/e/edk2-arm-${pkgver}-${pkgrel}.fc${fedora_ver}.noarch.rpm")

sha256sums=('7cd8d45ee3b70b1eed6bb2a272b6b476d432f66ca41f1dd189a6e2a4e15628c4'
            '37902dece7259e0536661183e3143fb9e2a0359f99ebb24765de63bd6fed152a')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}
