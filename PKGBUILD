# Maintainer: nl6720 <nl6720@gmail.com>

pkgname='shim-signed'
pkgver='15.f8'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments'
url='https://apps.fedoraproject.org/packages/shim'
arch=('x86_64')
license=('BSD')
options=('!strip')
source_x86_64=("https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//.f/\/}/x86_64/shim-x64-${pkgver//.f/-}.${CARCH}.rpm")
sha512sums_x86_64=('bea58059801c9af1f9beab675cf7b6bb7262278b1fe874cb56c3dec051a71236a352d3444f82ee0204518fdf1e18cbde4ce2d240dc1223dda2409ea23c3daa48')

package() {
	# EFI binaries for x86_64 UEFI
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/shimx64.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/mmx64.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/BOOT/fbx64.efi"
}
