# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=tsenart
_upstream_pkgname=vegeta
pkgname=vegeta-bin
pkgver=12.2.1
pkgrel=1
pkgdesc="Vegeta is a versatile HTTP load testing tool built out of a need to drill HTTP services with a constant request rate. It can be used both as a command line utility and a library."
arch=('x86_64')
_goos="linux"
_goarch="amd64"
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
url="https://github.com/${_pkgauthor}/${_upstream_pkgname}"
license=("MIT")
# https://github.com/tsenart/vegeta/releases/download/v12.0.0/vegeta-linux-amd64.tar.gz
# https://github.com/tsenart/vegeta/releases/download/cli/v12.1.0/vegeta-12.1.0-linux-amd64.tar.gz
source=("${_upstream_pkgname}-${pkgver}-${_goos}-${_goarch}.tar.gz::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/cli/v${pkgver}/${_upstream_pkgname}-${pkgver}-${_goos}-${_goarch}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/master/LICENSE")
sha256sums=(
  "b1ca092c0a45a5c7d3092d9c2e00505dc40b9091bc01267651e887e12b30f1ca"
  "374db7067e9e238a74a5c3d25d9f17d5a6fb885e4b6392897ceffcabb274fd7c"
)

package() {

  install -Dm755 "${srcdir}/${_upstream_pkgname}" "${pkgdir}/usr/bin/${_upstream_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}/LICENSE"
}
