# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=pipethis
pkgver=0.2
pkgrel=1
pkgdesc='Replace your $(curl | sh) installers'
arch=('i686' 'x86_64')
url="https://github.com/ellotheth/pipethis"
license=('GPL2')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ccd4517263b8e4e9d28d71f3f9c4cd5ba38697b906c0b3c759547342f0c01c01')
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
