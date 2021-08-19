# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=dracut-uefi-hook
pkgver=1
pkgrel=6
pkgdesc="Install/update/removal hooks for dracut unifed uefi image generation"
arch=(any)
license=('MIT')
depends=(dracut systemd)
source=('90-dracut-uefi-install.hook'
        '60-dracut-uefi-remove.hook'
        'dracut-uefi-install'
        'dracut-uefi-remove')
sha256sums=('2429d3a7bd79fbb6f7a736f1beb88eaaa2a3a0585d9321fa18459c4f92085b15'
            '0fb3d028214ff7579386ca4b172a88fb7edb88b81286cfb7f82bd511d2f91832'
            'cc9da31b43fc85fc415a88b907bdf6c5a3d0efe38f5d13b3f97425b7af13bfb2'
            'f8afca50be5505d32717233c58f58b439a34731559bc699bffefe9f98271e556')

package() {
  install -Dm644 "${srcdir}/90-dracut-uefi-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-uefi-install.hook"
  install -Dm644 "${srcdir}/60-dracut-uefi-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-uefi-remove.hook"
  install -Dm755 "${srcdir}/dracut-uefi-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-install"
  install -Dm755 "${srcdir}/dracut-uefi-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-remove"
}
