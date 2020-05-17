# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-suspicious-login
pkgver=3.1.0
pkgrel=1
pkgdesc="Detect and warn about suspicious IPs logging into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/suspicious_login"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/suspicious_login/releases/download/v${pkgver}/suspicious_login.tar.gz")
sha512sums=('6d57b8790f93947d90a4e582cba6ef6521ac98304b62411ed34a35196d180cf996d408f49e63fc70b274bced5b362e228ad2f3779bdb29e3af20ef98fa677474')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/suspicious_login" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
  install -D "${srcdir}/suspicious_login/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
