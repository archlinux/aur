# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname='shim-signed'
pkgver='16.1+fedora+8'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 and AA64 binaries from Fedora)'
url='https://koji.fedoraproject.org/koji/packageinfo?packageID=14502'
arch=('any')
license=('BSD-2-Clause')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//+fedora+/\/}/x86_64/shim-x64-${pkgver//+fedora+/-}.x86_64.rpm"
        "https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//+fedora+/\/}/aarch64/shim-aa64-${pkgver//+fedora+/-}.aarch64.rpm")
sha512sums=('26215953f7b01da06d0452b4287277ad5fc295a1aa4b79c1ff9d9a454fb029ae2a2090a64609d8ea42613bd5ae3e02ccebd1bea6e6912bbd5e0cd6de320723f2'
            '6909ad0fb154a32cca3ceaf7f5b51e1efb23358c827320d40aff2247a8b906dc5accf8ada5ffb6b8590790ef00f602289b7398dbfcdb5493227cfeb0263545fc')

package() {
	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/usr/lib/efi/shim/${pkgver//+fedora+/-}/EFI/fedora/"{shim,mm}{x64,aa64}".efi"
	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/usr/lib/efi/shim/${pkgver//+fedora+/-}/EFI/BOOT/fb"{x64,aa64}".efi"
}
