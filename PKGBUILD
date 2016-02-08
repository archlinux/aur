# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-roundcube
pkgver=2.6.2
pkgrel=1
pkgdesc="Roundcubemail integration for owncloud"
arch=('any')
url="http://apps.owncloud.com/content/show.php/?content=151523"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.zip::https://apps.owncloud.com/CONTENT/content-files/151523-roundcube.zip")
md5sums=('8ba8bf0435908a60d758cc78372e723c')

prepare() {
  cd ${srcdir}/roundcube
  rm -f .DS_Store
}

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/roundcube ${pkgdir}/usr/share/webapps/owncloud/apps/roundcube
}
