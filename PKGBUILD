# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=8.7.3
pkgrel=2
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("owncloud-app-news-${pkgver}.tar.gz::https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("3cbf54abc02390b46c18155a3705f8a158b3a7f336dc7992e5bec6faae1ec21f4e0b100fa379e9e8078ed4fe7dd39c6f0b20db7f1fa81ee0052623a8f01ac145")

build() {
  cd "news-${pkgver}"
  make
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
