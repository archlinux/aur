# Maintainer: levinit
# Co-Maintainers: robertfoster, stafwag, Solskogen

pkgname=edk2-avmf
pkgver=20220221gitb24306f15daa
pkgrel=3
fedora_ver=37
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

sha256sums=('71f283f363e6e9c9da6fc84b713f587fc5aafba51e912e6829cad6d73ccd38ab'
            '1f4c0ee9342e444e14a648c96b4c1e06f19c8a922e3ac06de63d9ad3b06df776')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}

