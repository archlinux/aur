# Maintainer: levinit
# Co-Maintainers: robertfoster, stafwag, Solskogen

pkgname=edk2-avmf
pkgver=20220526git16779ede2d36
pkgrel=1
fedora_ver=37
fedora_rel=4
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

sha256sums=('083a8a2bc06f9fa90b90b7a5983f61466e7ed8c3018bfdca55c872b55ec929a5'
				'e6b0a211b7d793c67864271db22f1a97f23606ea288c15d5f261cbc723fb5a12')


install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}

