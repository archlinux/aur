# Maintainer: Pouyan Heyratpour <pouyan@janstun.com>

pkgname=polywatch
_pkgname=polywatch
pkgver=1.0.0
pkgrel=1
pkgdesc="File change watcher"
arch=('any')
url="https://pouyanh.github.io/polywatch/"
license=('GPL3')
depends=('go')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/archive/v${pkgver}.tar.gz)
md5sums=('4482bc06dfad33ee98d04691a6863d04')

package() {
  cd "${_pkgname}-${pkgver}"

  go mod tidy
  go build ./cmd/polywatch
  install -Dm 755 polywatch -t "${pkgdir}/usr/bin/${_pkgname}"
}