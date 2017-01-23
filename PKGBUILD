# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=visago
pkgver=0.5.0
pkgrel=0
pkgdesc="Visual AI Aggregator."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/visago"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("visago=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ba8e4143b3e7fb81f3cefabbaa17cf840614c14b08a0b53e4f938e1d37db774a')
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
