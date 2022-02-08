# Maintainer: dreieck

_pkgname=marble-maps-mapycz
pkgname="${_pkgname}"
epoch=0
pkgver=20220207.01
pkgrel=2
pkgdesc="Maps for KDE marble by mapy.cz (Czech Republic & Slovakia (OSM-based with own additions), and Worldwide (OSM based))."
url="http://mapy.cz/"
arch=('any')
license=('custom: Public Domain, mapy.cz.')
groups=()
depends=(
  'marble-common'
)
makedepends=(
  'zstd'
)
optdepends=()
provides=()
conflicts=()
replaces=()
options=('emptydirs')
source=(
  "marble-maps-mapycz-${pkgver}.tar.zst::http://ix.io/3OYZ"
  'COPYING.txt'
)
sha256sums=(
  '72fc7894e72b6863346ff6056842f1fb60eb35aaf7f902fbc10b0cff52293c47'
  'a61e1170e1825cca85fb9a3bc21d00347e636e155f6def34761f8f434a962e78'
)

package() {
  cd "${srcdir}"

  mkdir -pv "${pkgdir}/usr/share/marble/data/maps/earth"
  cp -rv mapycz-* "${pkgdir}/usr/share/marble/data/maps/earth"/
  chmod -R a+Xr "${pkgdir}/usr/share/marble/data/maps/earth"

  install -v -D -m644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
