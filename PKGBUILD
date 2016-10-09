# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=visago
pkgver=0.3.2
pkgrel=0
pkgdesc="Visual AI Aggregator."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/visago"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8a412c9d7fab879fb2176919417057f966731817199e2f29b1380c6f64223023')
_gourl="github.com/zquestz/${pkgname}"

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  export GOBIN="${srcdir}/bin"
  go get -v ${_gourl}
}

package() {
  install -Dm 775 "${srcdir}/bin/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
