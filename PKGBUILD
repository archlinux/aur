# Maintainer: levinit
# Co-Maintainers: robertfoster, stafwag

pkgname=edk2-avmf
pkgver=20210527gite1999b264f1f
pkgrel=3
fedora_ver=36
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

sha256sums=('b680dbe44ea64a6e2fac01681e5178f5d6020d9dcc047d8d75b90d1c7d5778eb'
            '3d161dc608658859b4a48fad43f96207251239e93a521c0a1f0fd6c68415d15c')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}

