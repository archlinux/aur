# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-collabora-online
pkgver=1.1.11
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/owncloud/richdocuments"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("collaboraonline-${pkgver}.tar.gz::https://github.com/owncloud/richdocuments/archive/${pkgver}.tar.gz")
sha512sums=("cdd0194861d9d9b3c413961f0d4883d0264d75daa054f5a7b4290cea1590376341057b0c6aeb81b52d31840f1273b69e8f96e19a632856f32e91c1dbc20d5158")

build() {
  cd "${srcdir}/richdocuments-${pkgver}"
  make dist
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/collaboraonline"
  tar --strip-components=1 -xvf "${srcdir}/richdocuments-${pkgver}/owncloud-collabora-online-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps/collaboraonline"
}
