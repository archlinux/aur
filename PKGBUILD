# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.1.6
pkgrel=1
pkgdesc="Web search from the terminal. Supports amazon, bing, digg, dockerhub, duckduckgo, github, go, google, npm, npmsearch, pinterest, reddit, soundcloud, stackoverflow, twitter, wikipedia, yahoo, and youtube."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8fa431d286319247c644183e7ccc5d054f8d5349e1164d699a03a173cf2fcf7f')
_gourl="github.com/zquestz/${pkgname}"

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
