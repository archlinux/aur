# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=dracut-ukify
pkgver=8
pkgrel=1
pkgdesc="Integration layer for dracut and systemd's ukify tool for Arch Linux"
url="https://aur.archlinux.org/packages/dracut-ukify"
arch=(any)
license=('MIT')
depends=(dracut systemd-ukify python util-linux)
optdepends=(
	'sbsigntools: secureboot support'
)
source=('10-dracut-ukify-pre-install.hook'
        '60-dracut-ukify-remove.hook'
        '90-dracut-ukify-dkms-remove.hook'
        '90-dracut-ukify-install.hook'
        'dracut-ukify'
        'dracut-ukify.conf')
sha256sums=('7be65bccc0e7b861961cc8902a120d8c0bf5cfce8ba83e2ade8aa772c4b4417f'
            '341cd01546d840e7401f7bec868a78e2f6ca12563e93d993a07bc51efe674ed0'
            'dc319246e6dacc16b23a2ed2886e6468020e978a9b3f2fb9bb4cd06a82888490'
            '08225b2c3f5e2a734561b5fa9a3e84060dfffd85b2898adb0fff0ce3b068b4d0'
            '332565e1f68ef90c55a6a894de784003209dadb96ff5384cd0891b936dad53a9'
            '931704a244590b64e9640a20e1c92b869c9c2574f770b3abcd76b1a801bb2792')
backup=(etc/dracut-ukify.conf)
provides=(dracut-hook)
conflicts=(dracut-hook-uefi dracut-uefi-hook)

package() {
  install -Dm644 "${srcdir}/10-dracut-ukify-pre-install.hook" "${pkgdir}/usr/share/libalpm/hooks/10-dracut-ukify-pre-install.hook"
  install -Dm644 "${srcdir}/60-dracut-ukify-remove.hook"      "${pkgdir}/usr/share/libalpm/hooks/60-dracut-ukify-remove.hook"
  install -Dm644 "${srcdir}/60-dracut-ukify-remove.hook"      "${pkgdir}/usr/share/libalpm/hooks/60-dracut-ukify-remove.hook"
  install -Dm644 "${srcdir}/90-dracut-ukify-install.hook"     "${pkgdir}/usr/share/libalpm/hooks/90-dracut-ukify-install.hook"
  install -Dm755 "${srcdir}/dracut-ukify"                     "${pkgdir}/usr/bin/dracut-ukify"
  install -Dm644 "${srcdir}/dracut-ukify.conf"                "${pkgdir}/etc/dracut-ukify.conf"
}
