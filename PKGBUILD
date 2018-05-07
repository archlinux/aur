# Maintainer: nl6720 <nl6720@gmail.com>

pkgname='shim-signed'
pkgver='15.f5'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments'
url='https://apps.fedoraproject.org/packages/shim'
arch=('x86_64')
license=('BSD')
options=('!strip')
source_x86_64=("https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//.f/\/}/x86_64/shim-x64-${pkgver//.f/-}.${CARCH}.rpm")
sha512sums_x86_64=('4888e9422d71f4f8f05343e8dc161f8e48a31ba28469fe3671ce20283e5f7fced656f2d0583d76532dddecc49c2a8504a504b5da951a1e2c6302bf38fac5048e')

package() {
	# EFI binaries for x86_64 UEFI
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/shimx64.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/mmx64.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/BOOT/fbx64.efi"
}
