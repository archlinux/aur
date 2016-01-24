# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.1.1
pkgrel=1
pkgdesc="Web search from the terminal. Supports google, reddit, amazon, wikipedia, yahoo, duckduckgo, and bing"
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('64aceb91b657e0d694de2cc4a006d34abc5b3413fd1c6c55a96a696be42f9f49')
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
