# Maintainer: Robert-Jan Keizer <robertjankeizer at gmail dot com>

pkgname=domainchecker
pkgver=0.0.1
pkgrel=0
pkgdesc="Check domain availability from your cli and pass it to a domain supplier."
arch=('i686' 'x86_64')
url="http://github.com/KeizerDev/domainchecker"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("domainchecker=${pkgver}")
source=("https://github.com/KeizerDev/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b87715b368575d38d336d650b33e173fa916eb8757d7dd1bf547c0e4c155d661')
_gourl="github.com/KeizerDev/${pkgname}"

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
