# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice-git
_pkgname=onlyoffice-owncloud
pkgver=4.1.3.r0.gae70130
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-owncloud.git"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("git+https://github.com/ONLYOFFICE/onlyoffice-owncloud.git")
sha512sums=('SKIP')
provides=("nextcloud-app-onlyoffice")
conflicts=("nextcloud-app-onlyoffice")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice-owncloud" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
