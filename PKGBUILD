# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=plexrequests
pkgver=1.11.2
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
sha256sums=('02af79389f5a6c8816e67252d6d2701aa926a7823779c968b409cc7bf5c28f09'
         '5e2a1c4da328172e55a9d5591e0b36311e1051c3278deb3929cf5ce9e3dfbb43')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "plexrequests-meteor-${pkgver}/." "${pkgdir}/opt/${pkgname}"
  install -Dm644 "plexrequests-meteor-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

# vim:set ts=2 sw=2 et:
