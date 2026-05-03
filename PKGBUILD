# Maintainer: Oliver Jan Krylow <oliver@bugabinga.net>

pkgname=mdslw-bin
pkgver=0.17.1
pkgrel=1
_target="${CARCH}-unknown-linux-musl"
pkgdesc="MarkDown Sentence Line Wrapper"
arch=('x86_64')
url="https://github.com/razziel89/mdslw"
license=('GPL-3.0-or-later')
provides=('mdslw')
conflicts=('mdslw')
source=(
  "mdslw-${pkgver}-${_target}::${url}/releases/download/${pkgver}/mdslw_${_target}"
  "LICENCE-${pkgver}::${url}/raw/${pkgver}/LICENCE"
)
sha256sums=('ed442f0785b9e33b145bb45b0a5efcce58be8372c0f4ad55eb5d2ad7849cd61a'
            'e57f1c320b8cf8798a7d2ff83a6f9e06a33a03585f6e065fea97f1d86db84052')

package() {
  install -Dm755 "mdslw-${pkgver}-${_target}" "${pkgdir}/usr/bin/mdslw"
  install -Dm644 "LICENCE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
