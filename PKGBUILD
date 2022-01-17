# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=aavmf-bin
pkgver=2021.11
pkgrel=1
pkgdesc='QEMU Aarch64 Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://deb.debian.org/debian/pool/main/e/edk2/qemu-efi-aarch64_${pkgver}-${pkgrel}_all.deb")
sha256sums=('799fd816f122ca98d74623988a0491df6813f4b439a717d4fe826bcc2cc8d726')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/edk2"
	mv "$pkgdir/usr/share/qemu-efi-aarch64" "$pkgdir/usr/share/edk2/aarch64"
}
