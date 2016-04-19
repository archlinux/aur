# Maintainer: Donald Webster fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=plexrequests
pkgver=1.8.8
pkgrel=1
pkgdesc="Simple automated way for users to request new content for Plex"
arch=('any')
url="https://github.com/lokenx/plexrequests-meteor"
license=('MIT')
depends=('meteor-js')
optdepends=('couchpotato' 'sickrage' 'sonarr')
install='plexrequests.install'
source=("https://github.com/lokenx/plexrequests-meteor/archive/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('623ce13a59957b3d9d9ca875e6eac485e3aa898e8ae10224e08733451481933c'
         '5e2a1c4da328172e55a9d5591e0b36311e1051c3278deb3929cf5ce9e3dfbb43')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "plexrequests-meteor-${pkgver}/." "${pkgdir}/opt/${pkgname}"
  install -Dm644 "plexrequests-meteor-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

# vim:set ts=2 sw=2 et:
