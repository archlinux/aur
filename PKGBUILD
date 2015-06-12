pkgname=owncloud-app-maps-git
pkgver=ab405b8
pkgrel=1
pkgdesc="Owncloud maps app"
arch=('any')
url="https://github.com/owncloud/maps"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
conflicts=('owncloud-app-maps')
source=("$pkgname::git+https://github.com/owncloud/maps.git")
sha512sums=("SKIP")

pkgver() {
  cd "$SRCDEST/$pkgname"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  rm -rf "${srcdir}/$pkgname/.git"
  cp -a "${srcdir}/$pkgname" "${pkgdir}/usr/share/webapps/owncloud/apps/maps"
}
