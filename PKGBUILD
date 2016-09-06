# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=9.0.4
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("owncloud-app-news-${pkgver}.tar.gz::https://github.com/nextcloud/news/archive/${pkgver}.tar.gz")
sha512sums=("fc7ae02ed4d2fb512ae9503d5a356d893cdbf8f504535f1206169d796652af5978757f88216b881fe549efd68938d347a04ef9361d9caf44873c451045cc2903")

build() {
  cd "news-${pkgver}"
  make
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
