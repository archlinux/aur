# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=8.8.3
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("owncloud-app-news-${pkgver}.tar.gz::https://github.com/nextcloud/news/archive/${pkgver}.tar.gz")
sha512sums=("a9291a6708d7ba407ae3109e79a68a922de3bacd883453a201930817deb623472aa66563b0a8229f6ac8780613c6676640a3d49d33de961abd3f3e411e08a060")

build() {
  cd "news-${pkgver}"
  make
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
