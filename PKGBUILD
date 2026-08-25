# Maintainer: robertfoster

pkgname=kodi-addon-rivulet
pkgver=0.21.0 # renovate: datasource=github-releases depName=rivulet-kodi/plugin.video.rivulet
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
sha256sums=('5fe914482e71820a43400e73f3d302698d404ee2045e6d29fdc559d3aa8c32de')

package() {
  install -dm755 "${pkgdir}/usr/share/kodi/addons"
  cp -a "${srcdir}/${_addonid}" "${pkgdir}/usr/share/kodi/addons/${_addonid}"

  install -Dm644 "${srcdir}/${_addonid}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/kodi/addons/${_addonid}/LICENSE"
}
