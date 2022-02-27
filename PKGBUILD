# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220226T025804Z
_pkgrel=1
pkgname=aavmf-bin
pkgver=2022.02
pkgrel=1
pkgdesc='QEMU Aarch64 Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-aarch64_${pkgver}-${_pkgrel}_all.deb")
sha256sums=('040f6a0b3076584e98374114fcfc3d89c3037c28f7417ffbd3f0d2999991cd05')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/edk2"
	mv "$pkgdir/usr/share/qemu-efi-aarch64" "$pkgdir/usr/share/edk2/aarch64"
}
