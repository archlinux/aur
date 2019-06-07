# Maintainer: Robert Csordas <xdever@gmail.com>
pkgname=arch-efiboot
_gitsha="bc7fc9e78fefbcfa9ba5663fe3da96a470734b77"
pkgver=1.0
pkgrel=1
epoch=
arch=("i386" "x86_64")
url="https://github.com/xdever/arch-efiboot"
groups=()
depends=("binutils" "pacman")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("git+https://github.com/xdever/arch-efiboot#commit=${_gitsha}")
license=('Apache')
md5sums=('SKIP')
pkgdesc="Builds bootable UEFI blobs (including kernel, initrd, ucode, cmdline) in /boot directory "
install="${pkgname}.install"

package () {
    install -D -m755 ${srcdir}/${pkgname}/build_kernel.sh ${pkgdir}/usr/bin/build_efi_kernels
    install -D -m644 ${srcdir}/${pkgname}/kernel-update.hook ${pkgdir}/etc/pacman.d/hooks/efi-kernel-update.hook
    sed -i 's/\/opt\/build_kernel\.sh/\/usr\/bin\/build_efi_kernels/' ${pkgdir}/etc/pacman.d/hooks/efi-kernel-update.hook
}
