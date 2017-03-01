# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/mabe-at/onlyoffice-nextcloud"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("git+https://github.com/mabe-at/onlyoffice-nextcloud.git")
sha512sums=("SKIP")

pkgver() {
  cd "onlyoffice-nextcloud"
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  echo "0.0.1"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice-nextcloud" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
