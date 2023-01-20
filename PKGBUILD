# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.1
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
source=(
  "https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('bfd49d6d83bd7f49d4343b9afd6c4e494d45a87c4cebc3c67952b167f9d9aa98'
            '2cbf72eaa81989bcd8b8db441f06f54ff5ad8beac87cf2f0793d26324fa462eb')

package() {
  cd "$srcdir"
  install -Dm755 dasel_linux_amd64 "${pkgdir}/usr/bin/dasel"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
