# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname='shim-signed'
pkgver='16.1+fedora+7'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 and AA64 binaries from Fedora)'
url='https://koji.fedoraproject.org/koji/packageinfo?packageID=14502'
arch=('any')
license=('BSD-2-Clause')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//+fedora+/\/}/x86_64/shim-x64-${pkgver//+fedora+/-}.x86_64.rpm"
        "https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//+fedora+/\/}/aarch64/shim-aa64-${pkgver//+fedora+/-}.aarch64.rpm")
sha512sums=('642f7bd66f9d420fed5d5686d968a2065af445b4e7ba3d27a0a4f5852aefadd1835c485968e7bdc7cea5f377095bd3efcc8636837e3059a19cfab1c777e218f0'
            '17236317039b612058b3610507dc6196d9eb6a2df6efbfc4c46100b5c436812451705a2676eba6219e1665031c9262fc79b78c97e42e7209e3794149c45cb4ee')

package() {
	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/usr/lib/efi/shim/${pkgver//+fedora+/-}/EFI/fedora/"{shim,mm}{x64,aa64}".efi"
	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/usr/lib/efi/shim/${pkgver//+fedora+/-}/EFI/BOOT/fb"{x64,aa64}".efi"
}
