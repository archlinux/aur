# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.3.6
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
source=(
  "${pkgname}-v${pkgver}.gz::https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "${pkgname}-v${pkgver}_repo.tar.gz::https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('9da7d1dfc61c719216b288e738d76c2204c5636e5c1f5ba1c7158abcee80facf'
            'aebed9ddaa1daf5de9080e2ed6eff1c90606a2ad2d9988d4b4fdbb243b1a71d7')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
