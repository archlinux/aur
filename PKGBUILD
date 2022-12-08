# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.2
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
source=(
  "https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d07be8c4f28819eec04185ae4fbc1cc9304c88d53d01bb2b5202cc0b811657b2'
            'cdb209c838b0f24520f35997c2856efbbdf695c314bc43ddcc3dc5180e8b812b')

package() {
  cd "$srcdir"
  install -Dm755 dasel_linux_amd64 "${pkgdir}/usr/bin/dasel"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
