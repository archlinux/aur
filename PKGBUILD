# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.1.5
pkgrel=1
pkgdesc="Web search from the terminal. Supports amazon, bing, digg, dockerhub, duckduckgo, github, google, pinterest, reddit, soundcloud, stackoverflow, twitter, wikipedia, and yahoo."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('984903a8e3f7465bb85f6aef317da2743ae1715c73cb379291b90c3816fdff7f')
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
