# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=muserv
pkgver=0.6.2
pkgrel=1
pkgdesc="muserv (UPnP server for music)"
arch=(
  aarch64
  x86_64
)
url="https://${_pkgorg}/${pkgname}/"
license=('GPL3')
depends=(
  mailcap
)
makedepends=(
  bash
  git
  go
  make
)
conflicts=(muserv-git)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('d4f573cee81676bc37c08b0a45d30962f5cbd4809a0dd12a6008f4927cc4672b')

build() {
  cd "${pkgname}-v${pkgver}" || return
  make
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
