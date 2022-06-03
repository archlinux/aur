# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220603T163609Z
_pkgrel=1
pkgname=aavmf-bin
pkgver=2022.05
pkgrel=1
pkgdesc='QEMU Aarch64 Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-aarch64_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('1d0768a0d65822aabf71600b204b13b17788d0f5e117558c54e966f5680f167a')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/edk2"
	mv "$pkgdir/usr/share/qemu-efi-aarch64" "$pkgdir/usr/share/edk2/aarch64"
}
