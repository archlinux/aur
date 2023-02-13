# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=dracut-uefi-hook
pkgver=7
pkgrel=1
pkgdesc="Install/update/removal hooks for dracut unifed uefi image generation"
url="https://aur.archlinux.org/packages/dracut-uefi-hook/"
arch=(any)
license=('MIT')
depends=(dracut systemd binutils util-linux)
source=('10-dracut-uefi-pre-install.hook'
        '90-dracut-uefi-install.hook'
        '60-dracut-uefi-remove.hook'
        'dracut-uefi-pre-install'
        'dracut-uefi-install'
        'dracut-uefi-remove'
        'dracut-uefi-hook.conf')
sha256sums=('757c1df6fae821ce9efb3fcc6f710951486042d9b1d993eccdfd9cf6cb491bf3'
            '7c6aae6a733582fd16852e949565493bb6af1a555ab755f1bf86b136df74244c'
            'e2a04362ed1b0d462a33444921c5e15e4a82ed34f9848b4fbad554e51fd10207'
            '0d22ae4428965a65b2d392d8b71486ad591c81f760c929ce15e7f2c908afe875'
            'eaafe8afd0727b24861d4f98702294d9ab8c0658f5d62c24aa3858b4b7e892dd'
            '8af469ab5647cd15c9370b4c44af422df99887105aca30531c0d4c7b92889f9d'
            '86a65fe822bff87a51e7fece85159a62a77a8f71f015d6400f6693d44dba9464')
backup=(etc/dracut-uefi-hook.conf)
provides=(dracut-hook)
conflicts=(dracut-hook-uefi)

package() {
  install -Dm644 "${srcdir}/10-dracut-uefi-pre-install.hook" "${pkgdir}/usr/share/libalpm/hooks/10-dracut-uefi-pre-install.hook"
  install -Dm644 "${srcdir}/60-dracut-uefi-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-uefi-remove.hook"
  install -Dm644 "${srcdir}/90-dracut-uefi-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-uefi-install.hook"
  install -Dm755 "${srcdir}/dracut-uefi-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-install"
  install -Dm755 "${srcdir}/dracut-uefi-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-remove"
  install -Dm755 "${srcdir}/dracut-uefi-pre-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-pre-install"
  install -Dm644 "${srcdir}/dracut-uefi-hook.conf"       "${pkgdir}/etc/dracut-uefi-hook.conf"
}
