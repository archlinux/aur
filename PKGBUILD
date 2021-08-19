# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=dracut-uefi-hook
pkgver=1
pkgrel=4
pkgdesc="Install/update/removal hooks for dracut unifed uefi image generation"
arch=(x86_64)
license=('MIT')
depends=(dracut systemd)
source=('90-dracut-uefi-install.hook'
        '60-dracut-uefi-remove.hook'
        'dracut-uefi-install'
        'dracut-uefi-remove')
sha256sums=('237cf72287f6802cd1782fb1df18a79061f48ba821a8d841d1e94cba95f5edca'
            '0fb3d028214ff7579386ca4b172a88fb7edb88b81286cfb7f82bd511d2f91832'
            '81d3b3529cebdddd68e3d2968a53c637091f1f3bde08368d28a64e66cb826601'
            'f8afca50be5505d32717233c58f58b439a34731559bc699bffefe9f98271e556')

package() {
  install -Dm644 "${srcdir}/90-dracut-uefi-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-uefi-install.hook"
  install -Dm644 "${srcdir}/60-dracut-uefi-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-uefi-remove.hook"
  install -Dm755 "${srcdir}/dracut-uefi-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-install"
  install -Dm755 "${srcdir}/dracut-uefi-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-remove"
}
