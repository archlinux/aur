# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=pipethis
pkgver=0.5
pkgrel=1
pkgdesc='Replace your $(curl | sh) installers'
arch=('i686' 'x86_64')
url="https://github.com/ellotheth/pipethis"
license=('GPL2')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f9922b387fd4e2ae7025afe2d77d865ead6f1ab1d8f47beccd26146792e6d9d8')
_gourl=github.com/ellotheth/pipethis

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go get -v ${_gourl}
}

package() {
  install -Dm 775 "${srcdir}/bin/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
