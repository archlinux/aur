# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Zack Baldwin <zack@zackb.com>

pkgname=ombi
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple automated way for users to request new content for Plex"
arch=('any')
url="https://github.com/tidusjar/Ombi"
license=('GPL2')
depends=('mono')
optdepends=('couchpotato' 'sickrage' 'sonarr' 'plex-media-server' 'plex-media-server-plexpass' 'headphones')
replaces=('plexrequests')
install='ombi.install'
source=("https://github.com/tidusjar/Ombi/releases/download/v${pkgver}/Ombi.zip"
        "${pkgname}.service"
        "${pkgname}.sysusers")

sha256sums=('292039ac73e531e0252f095b7a846e46c18307b06fa05c39821fe459a5723c2a'
            '7848835b38d284625ad9fe6d1a3bf01a233b6b6ebc59d8071daef2e618b16f93'
            '27704e4b5c5d944b774bf4d180684ff76f157d37ba9c5e39f7d03493962c81c6')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "Release/." "${pkgdir}/opt/${pkgname}"
  #install -Dm644 "Release/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/ombi.sysusers" "${pkgdir}/usr/lib/sysusers.d/ombi.conf"
}

# vim:set ts=2 sw=2 et:
