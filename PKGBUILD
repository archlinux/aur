# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-suspicious-login
pkgver=1.0.0
pkgrel=1
pkgdesc="Detect and warn about suspicious IPs logging into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/suspicious_login"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/suspicious_login/releases/download/v${pkgver}/suspicious_login.tar.gz")
sha512sums=("3323f9263ed18ef1059a6040436ee8865dabea8f1c7445782de0b831def269de9151edd2b6da30703f5ff28affd30f3a8225b8a1f60d31432cb64b0451703dbe")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/suspicious_login" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
  install -D "${srcdir}/suspicious_login/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
