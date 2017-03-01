# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-spreed.me
pkgver=0.3.7
pkgrel=1
pkgdesc="spreed.memail integration for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/spreedme"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://apps.owncloud.com/CONTENT/content-files/174436-spreedme.tar.gz")
sha256sums=('1f715122be9c6bc40d7be88243a982adfade6b117aacff4f1390f774801d0c60')

prepare() {
  cd ${srcdir}/spreedme
  rm -f .DS_Store
}

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/spreedme ${pkgdir}/usr/share/webapps/nextcloud/apps/spreedme
}
