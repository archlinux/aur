# Maintainer: robertfoster

pkgname=kodi-addon-rivulet
pkgver=0.28.0 # renovate: datasource=github-releases depName=rivulet-kodi/plugin.video.rivulet
pkgrel=1
pkgdesc='Kodi video add-on reimplementing the Stremio client experience: catalogs, add-on management, stream resolution and playback'
_addonid=plugin.video.rivulet
arch=('any')
url='https://github.com/rivulet-kodi/plugin.video.rivulet'
license=('MIT')
depends=('kodi')
optdepends=(
  'stremio-server-go: local streaming server for playback'
)
options=('!strip')
source=("${_addonid}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_addonid}-${pkgver}.zip")
sha256sums=('edcf6dc90165042354d59d5598fef8122beb2a67fd311084b2c02a63ec0575c0')

package() {
  install -dm755 "${pkgdir}/usr/share/kodi/addons"
  cp -a "${srcdir}/${_addonid}" "${pkgdir}/usr/share/kodi/addons/${_addonid}"

  install -Dm644 "${srcdir}/${_addonid}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/kodi/addons/${_addonid}/LICENSE"
}
