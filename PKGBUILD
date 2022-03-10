# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220310T035035Z
_pkgrel=2
pkgname=aavmf-bin
pkgver=2022.02
pkgrel=2
pkgdesc='QEMU Aarch64 Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-aarch64_${pkgver}-${_pkgrel}_all.deb")
sha256sums=('2f42218ef1fabfac725ebe94fcc132a61db2acf64f491e2498a296c726cbec79')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/edk2"
	mv "$pkgdir/usr/share/qemu-efi-aarch64" "$pkgdir/usr/share/edk2/aarch64"
}
