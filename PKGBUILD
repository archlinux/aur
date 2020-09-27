# Maintainer: levinit
# Co-Maintainer: robertfoster

pkgname=edk2-avmf
pkgver=20200801
pkgrel=1
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

sha256sums=('0da4f919cdaede39119ff2ee98888d8e2d7723d18920250b5e3ecb7822913bb4'
            '2189bc4833fbb2f93e4e08c8602483d79f46f3bb08749e1a0610e4ed236ba5f9')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}
