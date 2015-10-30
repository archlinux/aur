# Maintainer: Shujie Zhang
# Contributor: Shujie Zhang

pkgname=owncloud-app-news-git
pkgver=3.001.1112.g79f5e29
pkgrel=1
pkgdesc="An RSS/Atom feed reader app for ownCloud"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
conflicts=('owncloud-app-news')
provides=('owncloud-app-news')
source=("$pkgname::git+https://github.com/owncloud/news.git")
sha512sums=("SKIP")

pkgver() {
   cd "$SRCDEST/$pkgname"
   git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  rm -rf "${srcdir}/$pkgname/.git"
  cp -a "${srcdir}/$pkgname" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
