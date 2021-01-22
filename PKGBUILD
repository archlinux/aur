# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-suspicious-login
pkgver=3.2.1
pkgrel=1
pkgdesc="Detect and warn about suspicious IPs logging into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/suspicious_login"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/suspicious_login/releases/download/v${pkgver}/suspicious_login.tar.gz")
sha512sums=('fde1098246c7901ee2ec5349e61b5664c8a3b843057ad6fbe1af6a42dc23ee634278ad4a3cd7dce9b4055463a2dd8923523dbdc3657241237ac26e3dee24bab8')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/suspicious_login" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
  install -D "${srcdir}/suspicious_login/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
