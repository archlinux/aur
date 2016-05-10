# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=8.7.5
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("owncloud-app-news-${pkgver}.tar.gz::https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("a5fe3683dbd938faab6ced3c5ae8c5f479e15cc92c8618e405a2e454b535434d974e02568fd7f3e98abaa5b6a46757779e25928749df4d475dc61d415a5c3a17")

build() {
  cd "news-${pkgver}"
  make
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
