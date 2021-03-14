# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=dracut-uefi-hook
pkgver=1
pkgrel=2
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
            '1cf9022f12e59aa26cc668f3eb9822ff76a05921e3e8cc6d0642301d388b60aa'
            '90f7983b4eca8c44f5b651ee9622b454db79a1c8dff1f188e11c25065f94ebe4')

package() {
  install -Dm644 "${srcdir}/90-dracut-uefi-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-uefi-install.hook"
  install -Dm644 "${srcdir}/60-dracut-uefi-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-uefi-remove.hook"
  install -Dm755 "${srcdir}/dracut-uefi-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-install"
  install -Dm755 "${srcdir}/dracut-uefi-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi-remove"
}
