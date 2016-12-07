# Maintainer: nl6720 <nl6720@gmail.com>

pkgname='shim-signed'
pkgver='0.8.f10'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments.'
url='https://apps.fedoraproject.org/packages/shim-signed'
arch=('any')
license=('BSD')
options=('!strip')
source=("https://kojipkgs.fedoraproject.org/packages/${pkgname}/${pkgver//.f/\/}/x86_64/shim-${pkgver//.f/-}.x86_64.rpm")

sha512sums=('213e38ddf8027e740f9de011ee5cb576fbfa2d00963a830ce613efa9363a28a21afa024842e37a4576f93d00450a5753e63886595a4e1980b6d22ff110b7c9f2')

package() {
	install -D -m0644 "${srcdir}/boot/efi/EFI/fedora/shim.efi" "${pkgdir}/usr/share/${pkgname}/shim.efi"
	install -D -m0644 "${srcdir}/boot/efi/EFI/fedora/MokManager.efi" "${pkgdir}/usr/share/${pkgname}/MokManager.efi"
}
