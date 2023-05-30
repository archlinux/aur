# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.3.1
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
source=(
  "${pkgname}-v${pkgver}.gz::https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "${pkgname}-v${pkgver}_repo.tar.gz::https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('2b1836658653a97cb7da530b3e4eea9fe5d68a6cd935c8d01a3ac1dcb911d32c'
            'e242359621b30e56c1af6feb0a99ef4ef7f5aade324f923360095d5bf811e848')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
