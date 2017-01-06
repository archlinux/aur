# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio-git
pkgver=0.1.3.r71.gc00c1a0
pkgrel=1
pkgdesc="Listening to your favorite radio stations in Nextcloud"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('MIT')
depends=('nextcloud')
makedepends=('php')
options=('!strip')
provides=('nextcloud-app-radio')
conflicts=('nextcloud-app-radio')
source=("radio::git+https://github.com/onny/nextcloud-app-radio.git")
sha512sums=("SKIP")

#pkgver() {
#  cd "radio"
#  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
#}

#build() {
#  cd "${srcdir}/radio"
#  make appstore
#}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -r "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
  #tar -xvf "${srcdir}/mail/build/artifacts/tasks.tar.gz" -C "${pkgdir}/usr/share/webapps/nextcloud/apps/"
  #install -D "${pkgdir}/usr/share/webapps/nextcloud/apps/tasks/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
