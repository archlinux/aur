# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=8.1.0
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("owncloud-app-news-${pkgver}.tar.gz::https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("4ebca4492dc7ca5ed2ae9b752cdbb58c1503a13b08c72f22ff7efe88afcceaee6eeec8059b0d1c24581a2383da2999d84125a7306c04b6c26271bac336a7e857")

build() {
  cd "news-${pkgver}"
  make
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
