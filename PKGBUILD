# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.1.8
pkgrel=0
pkgdesc="Web search from the terminal. Supports [amazon bing digg dockerhub duckduckgo facebook gist github go google npm npmsearch pinterest quora reddit soundcloud stackoverflow twitter wikipedia yahoo youtube]"
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e74b0b95f83937a2b7dd216944a43856c5eb337edc795554e2ebeee954e68c64')
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
