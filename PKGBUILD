# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-suspicious-login
pkgver=4.0.0
pkgrel=1
pkgdesc="Detect and warn about suspicious IPs logging into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/suspicious_login"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/suspicious_login/releases/download/v${pkgver}/suspicious_login.tar.gz")
sha512sums=('d206ae67dff59241566b796429de5d109a601ed6b9be042ab5112b80f3baa928636776304ea074725ecf3048e3c29029f8e06891f40a17589c8dc701641747f3')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/suspicious_login" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
  install -D "${srcdir}/suspicious_login/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
