# Maintainer: levinit
# Co-Maintainers: robertfoster, stafwag

pkgname=edk2-avmf
#pkgver=20210527gite1999b264f1f
pkgver=20211126gitbb1bba3d7767
pkgrel=1
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

sha256sums=('e50e0621bf93363bcd125cda86b56b2f5c082eff82d856b0ba7948da1b9422ac'
            '030e759fbd2491fb27e15cbf505b4860828ac41065db0e3da1acdf23901042db')

install=${pkgname}.install

package() {
  cd "${srcdir}"/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr "${pkgdir}"
}

