# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=mmake
pkgver=1.3.0
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
sha256sums=('000ba7c0d16cb55d0d03325547b266da60cec31c25690c22707ef88994497dba')
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
