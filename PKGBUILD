# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.2
pkgrel=2
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
source=(
  "${pkgname}-v${pkgver}.gz::https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "${pkgname}-v${pkgver}_repo.tar.gz::https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('eae422674dbdb01ed3c98a5899411291292ef9f1b5cb1a8a24615d22c5a4eda2'
            '0ef6525a3618c24999f8b44f7f65ed94004a393fd73cea4ae7757d7ed55ba485')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
