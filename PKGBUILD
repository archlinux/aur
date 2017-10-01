# Maintainer: nl6720 <nl6720@gmail.com>

pkgname='shim-signed'
pkgver='13.f0.6'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments.'
url='https://apps.fedoraproject.org/packages/shim-signed'
arch=('x86_64')
license=('BSD')
options=('!strip')
source=("https://kojipkgs.fedoraproject.org/packages/${pkgname}/${pkgver//.f/\/}/${CARCH}/shim-${CARCH//86_/}-${pkgver//.f/-}.${CARCH}.rpm")

sha512sums=('b7ad948793db8c466e7f923ccaa56969509995ee3389c8aa6d1d2e8a30b4bd9aae393c36e107421af44aa3a4cab7fe560517bccee6d5484dad6dd0c2b6d11c37')

package() {
	install -D -m0644 "${srcdir}/boot/efi/EFI/fedora/shimx64.efi" "${pkgdir}/usr/share/${pkgname}/shimx64.efi"
	install -D -m0644 "${srcdir}/boot/efi/EFI/fedora/mmx64.efi" "${pkgdir}/usr/share/${pkgname}/mmx64.efi"

	ln -s 'shimx64.efi' "${pkgdir}/usr/share/${pkgname}/shim.efi"
	ln -s 'mmx64.efi' "${pkgdir}/usr/share/${pkgname}/MokManager.efi"
}
