# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttyplot
pkgver=1.4
pkgrel=2
pkgdesc='A realtime plotting utility for terminal with data input from stdin'
arch=(x86_64)
url=https://github.com/tenox7/ttyplot
license=('custom:The Unlicense')
depends=(ncurses)
makedepends=(make gcc)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tenox7/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11974754981406d19cfa16865b59770faaf3ade8d909d9a0134dc56e00d29bd4')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}

