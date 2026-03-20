pkgname=xtream-m3u-plus-iptv-player
pkgver=1.04.00
pkgrel=1
pkgdesc="PyQt5 IPTV player for Xtream Codes API and M3U_plus playlists"
arch=('any')
url="https://github.com/Youri666/Xtream-m3u_plus-IPTV-Player"
license=('GPL3')
depends=(
  'python'
  'python-pyqt5'
  'qt5-svg'
  'python-requests'
  'python-lxml'
  'python-dateutil'
)
optdepends=(
  'vlc: recommended external player'
  'smplayer: optional external player'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Youri666/Xtream-m3u_plus-IPTV-Player/archive/refs/tags/V${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.sh"
)
sha256sums=(
  'b7effee283b45e0a7e3d0f9b133c644dc354d80b65167bcb9e28834a65149812'
  '7d2f7f1d70b52e838a4497f938928597def1cc630e2acfa5cabf653ec1f51400'
  '5c1d0a0a83f160a708d1981b88cab2437a8110c8f8db304f6a8d83ff48033e10'
)

_srcname="Xtream-m3u_plus-IPTV-Player"

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "Images/tv_tab_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local appdir="${pkgdir}/usr/share/${pkgname}"
  install -d "${appdir}"

  install -m644 "IPTV M3U_Plus PLAYER by MY-1.py" "${appdir}/"
  install -m644 AccountManager.py "${appdir}/"
  install -m644 CustomPyQtWidgets.py "${appdir}/"
  install -m644 Threadpools.py "${appdir}/"
  cp -r Images "${appdir}/"
}
