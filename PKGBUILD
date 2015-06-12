pkgname=owncloud-app-notes-git
pkgver=0.5.276.g405ccf0
pkgrel=1
pkgdesc="Owncloud notes app"
arch=('any')
url="https://github.com/owncloud/notes"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
conflicts=('owncloud-app-notes')
source=("$pkgname::git+https://github.com/owncloud/notes.git")
sha512sums=("SKIP")

pkgver() {
  cd "$SRCDEST/$pkgname"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  rm -rf "${srcdir}/$pkgname/.git"
  cp -a "${srcdir}/$pkgname" "${pkgdir}/usr/share/webapps/owncloud/apps/notes"
}
