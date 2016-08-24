# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=plexrequests.net
pkgver=1.9.0
pkgrel=2
pkgdesc="Simple automated way for users to request new content for Plex"
arch=('any')
url="https://github.com/tidusjar/PlexRequests.Net"
license=('GPL2')
depends=('mono')
optdepends=('couchpotato' 'sickrage' 'sonarr' 'plex-media-server' 'plex-media-server-plexpass' 'headphones')
install='plexrequests.net.install'
source=("https://github.com/tidusjar/PlexRequests.Net/releases/download/v${pkgver}/PlexRequests.zip"
        "${pkgname}.service"
        "${pkgname}.sysusers")

sha256sums=('79c12e62abeb8f7b085ffe9de2ab333572b3a0f7b26c932c7f8e8fc8c8c204d4'
            'aca0066e5a42270bab07bb0fb1fce305aedc9681c3c1d2ecdec21db067966ac9'
            '5b999550de2a86a6033f12a9455d164957fd83a6013e0d88f61f98dbe3a88763')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "Release/." "${pkgdir}/opt/${pkgname}"
  #install -Dm644 "Release/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/plexrequests.net.sysusers" "${pkgdir}/usr/lib/sysusers.d/plexrequests.net.conf"
}

# vim:set ts=2 sw=2 et:
