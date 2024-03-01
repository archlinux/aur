# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-music-git
pkgver=0.3.7.2470.g22c20a53
pkgrel=1
pkgdesc="An music application for owncloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL')
depends=('owncloud')
makedepends=('git')
options=('!strip')
conflicts=('owncloud-app-music')
source=("$pkgname::git+https://github.com/owncloud/music.git")
sha512sums=("SKIP")

pkgver() {
  cd "$SRCDEST/$pkgname"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  rm -rf "${srcdir}/$pkgname/.git"
  cp -a "${srcdir}/$pkgname" "${pkgdir}/usr/share/webapps/owncloud/apps/music"
}
