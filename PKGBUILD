# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-spreed.me
pkgver=0.3.8
pkgrel=1
pkgdesc="spreed.memail integration for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/spreedme"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://apps.owncloud.com/CONTENT/content-files/174436-spreedme.tar.gz")
sha256sums=('7670bf76cc086a6301aa431d03a158357c6d2abbf6e5800cb01a34a9f2a50a64')

prepare() {
  cd ${srcdir}/spreedme
  rm -f .DS_Store
}

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/spreedme ${pkgdir}/usr/share/webapps/nextcloud/apps/spreedme
}
