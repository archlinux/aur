# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.1
pkgrel=2
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
source=(
  "${pkgname}-v${pkgver}.gz::https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "${pkgname}-v${pkgver}_repo.tar.gz::https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('3899ad599ba19d8dd0a8a2a2eb37e5d998e3043875d376d528956a1c6af64b6f'
  '2cbf72eaa81989bcd8b8db441f06f54ff5ad8beac87cf2f0793d26324fa462eb')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
