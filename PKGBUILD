# Maintainer: levinit
# Co-Maintainers: robertfoster, stafwag, Solskogen

pkgname=edk2-avmf
#pkgver=20210527gite1999b264f1f
pkgver=20211126gitbb1bba3d7767
pkgrel=2
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

sha256sums=('74ba5ed283fde7ae8633e90cd09c59ad79fbd3e57f66ccb7b63bf827d5cf072c'
            'bfc2d3efe7eec42b2434544e0eda1a1b4e0cd5e60fc76f0c7adf2c227edb074e')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}

