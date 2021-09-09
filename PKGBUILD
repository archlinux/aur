# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=aavmf-bin
pkgver=2021.08
pkgrel=1
pkgdesc='QEMU Aarch64 Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://deb.debian.org/debian/pool/main/e/edk2/qemu-efi-aarch64_${pkgver}-${pkgrel}_all.deb")
sha256sums=('bfb967d5aa75702732f83a83f02e4a31805764c8480ea42e2b5baed735bd0992')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/edk2"
	mv "$pkgdir/usr/share/qemu-efi-aarch64" "$pkgdir/usr/share/edk2/aarch64"
}
