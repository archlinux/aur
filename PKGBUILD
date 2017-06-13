# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=mmake
pkgver=1.2.0
pkgrel=1
pkgdesc='Modern Make'
arch=('i686' 'x86_64')
url='https://github.com/tj/mmake'
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('mmake-bin')
replaces=('mmake-bin')
provides=("mmake=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('b6b22b7c9b64b5f158971e737bae86e5477e1697a8d5e8223dbcfa154f1eaa3a')
_gourl="github.com/tj/${pkgname}/cmd/${pkgname}"

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go get -v ${_gourl}
}

package() {
  install -Dm 775 "${srcdir}/bin/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
