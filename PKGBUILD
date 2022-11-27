# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=1.27.3
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
makedepends=('git')
source=(
  "https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('5ebe657e20cddef0fb01b62e3570d4a10105cff61abc5912857fd7ff31c06e76'
            '1dfd0bf372ab252931adc636887c1d34a75e9ac767b5e6baabf9fd91fdfa15a6')

package() {
  cd "$srcdir"
  install -Dm755 dasel_linux_amd64 "${pkgdir}/usr/bin/dasel"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
