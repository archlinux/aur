# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-keeweb
pkgver=0.4.0
pkgrel=5
pkgdesc="Open Keepass stores inside Nextcloud"
arch=('any')
url="https://github.com/jhass/nextcloud-keeweb"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/jhass/nextcloud-keeweb/releases/download/v${pkgver}/keeweb-${pkgver}.tar.gz")
sha512sums=("827e214622cf08b0af07a91a3764c47486333da2328883f3e4af6758316a8cb63341428ea8d2ff3f02bc86da3408ac5e21e653984d5b6455756963d9a26716bc")

prepare() {
  cd "${srcdir}/keeweb"
  sed -i 's/max-version="12"/max-version="15"/g' "appinfo/info.xml"
  sed -i '3i\  width: 100%;' "css/style.css"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/keeweb" "${pkgdir}/usr/share/webapps/nextcloud/apps/keeweb"
}
