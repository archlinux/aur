# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=qbittorrent-nightwalker
_pkgname="${pkgname#qbittorrent-}"
pkgver=0.0.2
pkgrel=1
pkgdesc='A dark but not black qBittorrent WebUI'
arch=(any)
url='https://github.com/CallMeBruce/nightwalker'
license=('MIT')
optdepends=(
  'qbittorrent: for use with qbittorrent'
  'qbittorrent-nox: for use with qbittorrent-nox'
)
options=(!debug)
install="${pkgname}.install"
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ad00cbccc60d05f5a60841070770d969b7c8c594e24ff253ab81b447ca28866d')

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 webui.qrc "${pkgdir}/usr/share/${pkgname}/weubui.qrc"
  cp -dr --no-preserve=ownership private "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership public "${pkgdir}/usr/share/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
