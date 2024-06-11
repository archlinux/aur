# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=mayhem
pkgver=1.2.3
pkgrel=1
pkgdesc="A minimal TUI-based task tracker"
arch=('any')
url="https://github.com/BOTbkcd/${pkgname}"
license=('MIT')
depends=('sqlite')
makedepends=('go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('84d3e1d15db0f917a91f676636e867515b0c8e847409b7387682c0badbbdabe7')

build() {
  cd "${srcdir}/${_pkgsrc}"
  go build -o "${srcdir}/${_pkgsrc}/${pkgname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
