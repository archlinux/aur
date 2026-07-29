# Maintainer: Your Name <you@example.com>
pkgname=azerothcore-clientdata
_pkgname=azerothcore-wotlk
pkgver=20.0
pkgrel=3
pkgdesc="Pre-extracted client map data assets for AzerothCore"
arch=('any')
url="https://www.azerothcore.org"
license=('AGPL3')
depends=('azerothcore-wotlk-git')
install='azerothcore-clientdata.install'
makedepends=('unzip')
options=(!strip !debug)
source=("Data.zip::https://github.com/wowgaming/client-data/releases/download/v${pkgver}/Data.zip")
sha256sums=('a3d4df635ae6c2c8f08052c32a79e0f806955150ad36b014a823dd08a32a4610')

build() {
  :
}

package() {
  local tmp_download="${srcdir}"
  local pkgdata="${pkgdir}/usr/share/azerothcore/data"

  install -d "${pkgdata}"

  echo " -> Extracted client data available in ${tmp_download}"

  install -d "${pkgdata}/Cameras"
  cp -fr "${srcdir}/"[Cc]ameras/. "${pkgdata}/Cameras/"

  install -d "${pkgdata}/dbc"
  cp -fr "${srcdir}/"[Dd][Bb][Cc]/. "${pkgdata}/dbc/"

  install -d "${pkgdata}/maps"
  cp -fr "${srcdir}/"[Mm]aps/. "${pkgdata}/maps/"

  install -d "${pkgdata}/mmaps"
  cp -fr "${srcdir}/"[Mm][Mm]aps/. "${pkgdata}/mmaps/"

  install -d "${pkgdata}/vmaps"
  cp -fr "${srcdir}/"[Vv][Mm]aps/. "${pkgdata}/vmaps/"
}