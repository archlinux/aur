# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=bitnami-labs
_upstream_devteam=sealed-secrets
_upstream_pkgname=kubeseal
pkgname=kubeseal-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="SealedSecret is a way to encrypt kubernetes secrets, which are safe to store on a public source code repository."
arch=('x86_64')
_goarch="amd64"
_goos="linux"
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
url="https://github.com/${_pkgauthor}/${_upstream_devteam}"
license=("Apache")
### https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.7.0/kubeseal-linux-amd64
source=("${_upstream_pkgname}-${_goos}-${_goarch}::https://github.com/${_pkgauthor}/${_upstream_devteam}/releases/download/v${pkgver}/${_upstream_pkgname}-${_goos}-${_goarch}"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_devteam}/master/LICENSE")
sha256sums=(
  "8b6d599f8a0c5a497f02c1402726aa8edb95f033dede416eeb13d3db9ab708d6"
  "SKIP"
)

package() {

  install -Dm755 "${srcdir}/${_upstream_pkgname}-${_goos}-${_goarch}" "${pkgdir}/usr/bin/${_upstream_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}/LICENSE"

}
