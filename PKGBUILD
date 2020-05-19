# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio-git
pkgver=r13.838dab9
pkgrel=1
pkgdesc="Listening to radio stations (Git variant)"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('MIT')
depends=('nextcloud')
makedepends=('php')
options=('!strip')
provides=('nextcloud-app-radio' 'nextcloud-app-radio-git')
conflicts=('nextcloud-app-radio')
source=("git+https://github.com/onny/nextcloud-app-radio.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/nextcloud-app-radio"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a ${srcdir}/radio* "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
