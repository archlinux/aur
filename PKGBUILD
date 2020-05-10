# Maintainer: levinit
# Co-Maintainer: robertfoster

pkgname=edk2-avmf
pkgver=20200201
pkgrel=1
fedora_ver=32
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
  "https://mirrors.tuna.tsinghua.edu.cn/fedora/updates/${fedora_ver}/Everything/x86_64/Packages/e/edk2-aarch64-${pkgver}stable-${pkgrel}.fc${fedora_ver}.noarch.rpm"
  "https://mirrors.tuna.tsinghua.edu.cn/fedora/updates/${fedora_ver}/Everything/x86_64/Packages/e/edk2-arm-${pkgver}stable-${pkgrel}.fc${fedora_ver}.noarch.rpm")

sha256sums=('8ac885bdf84307a129892082a17b977309dac909939ce3f91dc69def61a23390'
            '4231c16f116a6ff82e284565404f576a6c3cc6777837a6ed0dc2047a238f0fc5')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}
