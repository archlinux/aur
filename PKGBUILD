# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=pipethis
pkgver=0.1
pkgrel=1
pkgdesc="Replace your `curl | sh` installers"
arch=('i686' 'x86_64')
url="https://github.com/ellotheth/pipethis"
license=('GPL2')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ca27e1a3fcf50af3737c58fdedddbeba3d5dcbfb6e2e14abdc998d2989317fa1')
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
