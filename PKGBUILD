# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=mpv-tools
_srcname=mpv
pkgver=0.29.0
pkgrel=2
pkgdesc="Helper scripts from mpv/TOOLS"
arch=('any')
url="https://github.com/mpv-player/mpv"
license=('GPL')
depends=('mpv' 'bash')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/mpv-player/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('772af878cee5495dcd342788a6d120b90c5b1e677e225c7198f1e76506427319')

package() {
  cd "${_srcname}-${pkgver}/TOOLS"

  tools=('idet.sh' 'mpv_identify.sh' 'umpv')

  for x in ${tools[@]}; do
    if [[ ! "${x}" == *"mpv"* ]]; then
      f="mpv_${x}"
    else
      f="${x}"
    fi
    install -Dm755 "${x}" "${pkgdir}/usr/bin/${f}"
  done
}
