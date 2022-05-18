# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220517T205511Z
_pkgrel=1
pkgname=aavmf-bin
pkgver=2022.05_rc1
pkgrel=1
pkgdesc='QEMU Aarch64 Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-aarch64_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('1435523905671b79b6c2989045e4e6a2f30baf3a0a435b80c4b7f3543ea3f89a')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/edk2"
	mv "$pkgdir/usr/share/qemu-efi-aarch64" "$pkgdir/usr/share/edk2/aarch64"
}
