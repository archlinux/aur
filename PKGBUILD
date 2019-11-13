# Maintainer: levinit
pkgname=edk2-avmf
pkgver=20190501
pkgrel=4
fedora_ver=31
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
  "https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/${fedora_ver}/Everything/x86_64/os/Packages/e/edk2-aarch64-${pkgver}stable-${pkgrel}.fc${fedora_ver}.noarch.rpm"
  "https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/${fedora_ver}/Everything/x86_64/os/Packages/e/edk2-arm-${pkgver}stable-${pkgrel}.fc${fedora_ver}.noarch.rpm")

sha256sums=('SKIP' 'SKIP')

install=${pkgname}.install

package() {
  cd $srcdir/usr/share/AAVMF
  ln -sf ../edk2/arm/vars-template-pflash.raw AAVMF32_VARS.fd
  cd "${srcdir}"
  cp -av usr $pkgdir
}
