# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.4.1
pkgrel=0
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8df649412f88974af112517e57db70fd94f361d9ea691d8f63498b8cefa9cc6f')
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
