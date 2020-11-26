# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=mpv-tools
_srcname=mpv
pkgver=0.33.0
pkgrel=1
pkgdesc="Helper scripts from mpv/TOOLS"
arch=('any')
url="https://github.com/mpv-player/mpv"
license=('GPL')
depends=('mpv' 'bash')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/mpv-player/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('f1b9baf5dc2eeaf376597c28a6281facf6ed98ff3d567e3955c95bf2459520b4')

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
