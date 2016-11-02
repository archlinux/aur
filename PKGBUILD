# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-collabora-online
pkgver=1.1.12
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/owncloud/richdocuments"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("collaboraonline-${pkgver}.tar.gz::https://github.com/owncloud/richdocuments/archive/${pkgver}.tar.gz")
sha512sums=("9672fc215a9eaaf83e33a026b85eaa59dfc0a344dd08aef7f5836ff62cc9316e2cad4b587fd3ea229d9e31cecf4d386a543e5f6d2562666433ac6b29428370d2")

build() {
  cd "${srcdir}/richdocuments-${pkgver}"
  make dist
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/collaboraonline"
  tar --strip-components=1 -xvf "${srcdir}/richdocuments-${pkgver}/owncloud-collabora-online-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
