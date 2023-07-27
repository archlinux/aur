# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=booster-ukify
pkgver=1
pkgrel=1
pkgdesc="Integration layer for booster and systemd's ukify tool for Arch Linux"
url="https://aur.archlinux.org/packages/booster-ukify"
arch=(any)
license=('MIT')
depends=(booster systemd-ukify python util-linux)
optdepends=(
	'sbsigntools: secureboot support'
)
source=('10-booster-ukify-pre-install.hook'
        '90-booster-ukify-install.hook'
        '60-booster-ukify-remove.hook'
        'booster-ukify'
        'booster-ukify.conf')
sha256sums=('87d08ea560f3e0f23c9e7ea75c6ff366f1f7e83e1ecdbce296f6b327b79817e3'
            'a7bfd82f243b90d9acda5eaee23831ffd92ecbc69fbf633f48da00dcffa55925'
            '368d9c735eb7e015e371d04a7261dba0b7ad105b7192a3c2ee48511283e06dd8'
            '16c0bcb6639ab7d0bf63f20e5b5ed719baeb513801d0f39ce2857bdd81c1292c'
            'e9f964ad0c4314dcbe5d8ba63f503877ce4ad75299833097073549d26a02e931')
backup=(etc/booster-ukify.conf)

package() {
  install -Dm644 "${srcdir}/10-booster-ukify-pre-install.hook" "${pkgdir}/usr/share/libalpm/hooks/10-booster-ukify-pre-install.hook"
  install -Dm644 "${srcdir}/60-booster-ukify-remove.hook"      "${pkgdir}/usr/share/libalpm/hooks/60-booster-ukify-remove.hook"
  install -Dm644 "${srcdir}/90-booster-ukify-install.hook"     "${pkgdir}/usr/share/libalpm/hooks/90-booster-ukify-install.hook"
  install -Dm755 "${srcdir}/booster-ukify"                     "${pkgdir}/usr/bin/booster-ukify"
  install -Dm644 "${srcdir}/booster-ukify.conf"                "${pkgdir}/etc/booster-ukify.conf"
}
