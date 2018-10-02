# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.9.0
pkgrel=2
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
makedepends=('composer')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/archive/v${pkgver}.tar.gz")
sha512sums=("a1d08aabea29403ccc1525c3d38b86609c5fe58976c1f189b61f2710c120dbe628f02fa54cfe6f9e9b72510e73d1a34dc2ae5c40a43c222d0cfbb1fa5b3d7c18")

build() {
  cd "${srcdir}/twofactor_gateway-${pkgver}"
  composer install
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_pkgname}"
}
