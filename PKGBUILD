# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice-git
pkgver=0.0.1
pkgrel=3
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-owncloud.git"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("git+https://github.com/ONLYOFFICE/onlyoffice-owncloud.git")
sha512sums=("SKIP")
provides=("nextcloud-app-onlyoffice")
conflicts=("nextcloud-app-onlyoffice")

pkgver() {
  cd "onlyoffice-owncloud"
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  echo "0.0.1"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice-owncloud" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
