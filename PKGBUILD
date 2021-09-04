# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=dracut-uefi-hook
pkgver=2
pkgrel=1
pkgdesc="Install/update/removal hooks for dracut unifed uefi image generation"
arch=(any)
license=('MIT')
depends=(dracut systemd)
source=('90-dracut-uefi-install.hook'
        '60-dracut-uefi-remove.hook'
        'dracut-uefi-install'
        'dracut-uefi-remove'
        'dracut-uefi-hook.conf')
sha256sums=('2429d3a7bd79fbb6f7a736f1beb88eaaa2a3a0585d9321fa18459c4f92085b15'
            '0fb3d028214ff7579386ca4b172a88fb7edb88b81286cfb7f82bd511d2f91832'
            '0ca3c3763727b9630793eeb43b0d758587831ada83c609ba55c1c29704fb7bae'
            '7029dba277981c1f66f514a003f423a4e65b847d25d749affa37056a2ab922d2'
            '36de95c42cf6d64e352ebd559b0f06630d7d27d3b29ee7c9ac6ccddee6cb6826')
backup=(etc/dracut-uefi-hook.conf)

package() {
  install -Dm644 "${srcdir}/90-dracut-uefi-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-uefi-install.hook"
  install -Dm644 "${srcdir}/60-dracut-uefi-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-uefi-remove.hook"
  install -Dm755 "${srcdir}/dracut-uefi-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-install"
  install -Dm755 "${srcdir}/dracut-uefi-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-remove"
  install -Dm644 "${srcdir}/dracut-uefi-hook.conf"       "${pkgdir}/etc/dracut-uefi-hook.conf"
}
