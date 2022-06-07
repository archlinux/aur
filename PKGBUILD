# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220607T150728Z
_pkgrel=2
pkgname=aavmf-bin
pkgver=2022.05
pkgrel=2
pkgdesc='QEMU Aarch64 Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-aarch64_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('8e1fc66403c224fcccb4ca0ef3a8f6c97789117552c4358445614f7b8d58fef6')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/edk2"
	mv "$pkgdir/usr/share/qemu-efi-aarch64" "$pkgdir/usr/share/edk2/aarch64"
}
