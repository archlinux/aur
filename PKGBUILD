# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=dracut-uefi-hook
pkgver=4
pkgrel=1
pkgdesc="Install/update/removal hooks for dracut unifed uefi image generation"
arch=(any)
license=('MIT')
depends=(dracut systemd binutils util-linux)
source=('90-dracut-uefi-install.hook'
        '60-dracut-uefi-remove.hook'
        'dracut-uefi-install'
        'dracut-uefi-remove'
        'dracut-uefi-hook.conf')
sha256sums=('2429d3a7bd79fbb6f7a736f1beb88eaaa2a3a0585d9321fa18459c4f92085b15'
            '0fb3d028214ff7579386ca4b172a88fb7edb88b81286cfb7f82bd511d2f91832'
            '6f46e36799905c21b9b2a24a4bde415bad855e6e2c9a886c6bf22cd4dc4fb8c0'
            '8af469ab5647cd15c9370b4c44af422df99887105aca30531c0d4c7b92889f9d'
            '86a65fe822bff87a51e7fece85159a62a77a8f71f015d6400f6693d44dba9464')
backup=(etc/dracut-uefi-hook.conf)
url="https://aur.archlinux.org/packages/dracut-uefi-hook/"
conflicts=(dracut-hook-uefi)

package() {
  install -Dm644 "${srcdir}/90-dracut-uefi-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-uefi-install.hook"
  install -Dm644 "${srcdir}/60-dracut-uefi-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-uefi-remove.hook"
  install -Dm755 "${srcdir}/dracut-uefi-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-install"
  install -Dm755 "${srcdir}/dracut-uefi-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-remove"
  install -Dm644 "${srcdir}/dracut-uefi-hook.conf"       "${pkgdir}/etc/dracut-uefi-hook.conf"
}
