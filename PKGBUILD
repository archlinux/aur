# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-spreed.me
pkgver=0.3.5
pkgrel=1
pkgdesc="spreed.memail integration for owncloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php/Spreed.ME?content=174436"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://apps.owncloud.com/CONTENT/content-files/174436-spreedme.tar.gz")
sha256sums=('843432b002caa21f730571efda0a0611378f1da8da5a6fc80090d4270b8d111a')

prepare() {
  cd ${srcdir}/spreedme
  rm -f .DS_Store
}

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/spreedme ${pkgdir}/usr/share/webapps/owncloud/apps/spreedme
}
