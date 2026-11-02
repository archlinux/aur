# Maintainer: robertfoster

pkgname=kodi-addon-rivulet
pkgver=0.39.0 # renovate: datasource=github-releases depName=rivulet-kodi/plugin.video.rivulet
pkgrel=1
pkgdesc='Kodi video add-on reimplementing the Stremio client experience: catalogs, add-on management, stream resolution and playback'
_addonid=plugin.video.rivulet
arch=('any')
url='https://github.com/rivulet-kodi/plugin.video.rivulet'
license=('MIT')
depends=('kodi')
optdepends=(
  'rivulet-engine: local streaming server for playback'
)
options=('!strip')
source=("${_addonid}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_addonid}-${pkgver}.zip")
sha256sums=('00419834a522fe895864727293095d0b3778c7b6627f7451f8d99c01d93cc5aa')

package() {
  install -dm755 "${pkgdir}/usr/share/kodi/addons"
  cp -a "${srcdir}/${_addonid}" "${pkgdir}/usr/share/kodi/addons/${_addonid}"

  install -Dm644 "${srcdir}/${_addonid}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/kodi/addons/${_addonid}/LICENSE"
}
