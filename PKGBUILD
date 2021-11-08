# Maintainer: banzay <mrepnenkov@gmail.com>
pkgname=kernel-efi-copy-hook
pkgver=1
pkgrel=0
pkgdesc="Pacman hook to upgrade efi kernel"
arch=("any")
license=("GPL")
depends=('systemd')
source=(
        'kernel-efi-copy.hook'
        'kernel-efi-copy'
)

md5sums=('47c052eaa7484faf424fe3299b6ee547'
         '0b263bcdff120fc26a685c91122b132d')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m644 "${srcdir}/kernel-efi-copy.hook" "${pkgdir}/usr/share/libalpm/hooks/99-kernel-efi-copy.hook"
    install -m755 "${srcdir}/kernel-efi-copy" "${pkgdir}/usr/share/libalpm/scripts/kernel-efi-copy"
}
