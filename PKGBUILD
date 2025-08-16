# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname='shim-fedora'
_pkgname='shim'
_vendor='arch'
pkgver='15.8'
_upstream_pkgrel='3'
_downstream_pkgrel='2'
pkgrel="${_upstream_pkgrel}.${_downstream_pkgrel}"
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 binaries from Fedora). Target directory structure matches bootupd expectations.'
url='https://packages.fedoraproject.org/pkgs/shim/shim-x64'
arch=('x86_64')
license=('BSD-3-Clause')
options=('!strip' '!debug')
provides=("shim=$pkgver")
optdepends=('mokutil: Manage Machine Owner Keys (MOK)')
source=("https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/${_upstream_pkgrel}/x86_64/${_pkgname}-x64-${pkgver}-${_upstream_pkgrel}.x86_64.rpm")
sha256sums=('28958d75333c42b0341b727a2b697edf02f0cfaec18dbd25ae62c9a8164faabe')

package() {
	install -Dm0644 "${srcdir}/boot/efi/EFI/BOOT/BOOTX64.EFI" "${pkgdir}/usr/lib/efi/shim/${pkgver}-${_upstream_pkgrel}/EFI/BOOT/BOOTX64.EFI"
	install -Dm0644 "${srcdir}/boot/efi/EFI/BOOT/fbx64.efi" "${pkgdir}/usr/lib/efi/shim/${pkgver}-${_upstream_pkgrel}/EFI/BOOT/fbx64.efi"
	install -Dm0644 "${srcdir}/boot/efi/EFI/fedora/BOOTX64.CSV" "${pkgdir}/usr/lib/efi/shim/${pkgver}-${_upstream_pkgrel}/EFI/${_vendor}/BOOTX64.CSV"
	install -Dm0644 "${srcdir}/boot/efi/EFI/fedora/mmx64.efi" "${pkgdir}/usr/lib/efi/shim/${pkgver}-${_upstream_pkgrel}/EFI/${_vendor}/mmx64.efi"
	install -Dm0644 "${srcdir}/boot/efi/EFI/fedora/shim.efi" "${pkgdir}/usr/lib/efi/shim/${pkgver}-${_upstream_pkgrel}/EFI/${_vendor}/shim.efi"
	install -Dm0644 "${srcdir}/boot/efi/EFI/fedora/shimx64.efi" "${pkgdir}/usr/lib/efi/shim/${pkgver}-${_upstream_pkgrel}/EFI/${_vendor}/shimx64.efi"
}
