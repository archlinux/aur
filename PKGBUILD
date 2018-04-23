# Maintainer: nl6720 <nl6720@gmail.com>

[[ "$CARCH" == 'x86_64' ]] && _ARCH_SUFFIX='x64'

pkgname='shim-signed'
pkgver='13.f4'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments'
url='https://apps.fedoraproject.org/packages/shim-signed'
arch=('x86_64')
license=('BSD')
options=('!strip')
source_x86_64=("https://kojipkgs.fedoraproject.org/packages/${pkgname}/${pkgver//.f/\/}/${CARCH}/shim-${_ARCH_SUFFIX}-${pkgver//.f/-}.${CARCH}.rpm")

sha512sums_x86_64=('b6091fd4154b7cd4353e9bea2bcd0b796864c3c268a5a9ebce90e738afc7ab30924099b2127eec108d62da96983147c4d40292ed391ed1b2cfe5257b8d6fd474')

package() {
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/shim.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/MokManager.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/BOOT/fallback.efi"
}
