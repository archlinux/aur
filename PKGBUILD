# Maintainer: Zack Baldwin <zack@zackb.com>
pkgname=plexrequests
pkgver=1.8.3
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
sha256sums=('ec6b1aaddee9418df67ee8de8e9ac19ee8c2f91f0848408add9e8085218ceba3'
         '3790e9af329bc211f4116fae8742901f9dfd9d9f34abb2092119a298e5b3dbb1')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "plexrequests-meteor-${pkgver}/." "${pkgdir}/opt/${pkgname}"
  install -Dm644 "plexrequests-meteor-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

# vim:set ts=2 sw=2 et:
