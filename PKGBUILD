# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.3.4
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
source=(
  "${pkgname}-v${pkgver}.gz::https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "${pkgname}-v${pkgver}_repo.tar.gz::https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('9dd0229d67ac448d4a0699d7b2ca6fedbb830009906c08f822d9866b78d63045'
            '7c9a2f41d02f4d1717dcf0d9fb4b977308da89c074d2abcf064adf00980e5d0d')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
