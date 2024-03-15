# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=booster-ukify
pkgver=3
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
        '60-booster-ukify-remove.hook'
        '90-booster-ukify-dkms-remove.hook'
        '90-booster-ukify-install.hook'
        'booster-ukify'
        'booster-ukify.conf')
sha256sums=('6815b3ef4b969318d40251a655a52aec73a037c3db3fcdf33e921f230c23330a'
            'f142f5d1f4075a7ebaeb4d97d77843d7d547c627884847ee4df07d9a2a076356'
            '2e2596c9d5296a4df20f68ee9d2a7c96f4f51308c714d238309a3fbce0964fc2'
            '337a81f0429e50fe29d30077c14f413af80f31c8914c1e29076820eb5b5a6185'
            'ba3e3b8c57c0604149d2a9d1eccf3ecda1542023d897f7492f7c21c9d2953656'
            '7cd9c9107682fc06cab79d29f98ffc9a9544decb47cd46dc7467818f54189e41')
backup=(etc/booster-ukify.conf)

package() {
  install -Dm644 "${srcdir}/10-booster-ukify-pre-install.hook" "${pkgdir}/usr/share/libalpm/hooks/10-booster-ukify-pre-install.hook"
  install -Dm644 "${srcdir}/60-booster-ukify-remove.hook"      "${pkgdir}/usr/share/libalpm/hooks/60-booster-ukify-remove.hook"
  install -Dm644 "${srcdir}/90-booster-ukify-dkms-remove.hook" "${pkgdir}/usr/share/libalpm/hooks/90-booster-ukify-dkms-remove.hook"
  install -Dm644 "${srcdir}/90-booster-ukify-install.hook"     "${pkgdir}/usr/share/libalpm/hooks/90-booster-ukify-install.hook"
  install -Dm755 "${srcdir}/booster-ukify"                     "${pkgdir}/usr/bin/booster-ukify"
  install -Dm644 "${srcdir}/booster-ukify.conf"                "${pkgdir}/etc/booster-ukify.conf"
}
