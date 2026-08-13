# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=vscDebugger
pkgname=r-${_pkgname,,}
pkgver=0.5.9
pkgrel=1
pkgdesc='Support for Visual Studio Code Debugger'
arch=('x86_64')
url='https://github.com/ManuelHentschel/vscDebugger'
license=('MIT')
depends=(
  r
  r-jsonlite
  r-r6
)
source=("https://github.com/ManuelHentschel/vscDebugger/releases/download/v${pkgver}/${_pkgname}_${pkgver}.tar.gz"
        "LICENSE::https://github.com/ManuelHentschel/vscDebugger/raw/master/LICENSE.md"
)
sha256sums=('477526411c53fba146c980c33e284fde55bf6e515dff272f7c6ef7a31079f389'
            '1b7b090453df2f9a0a8037a80e13f801b8ec810c2069d28f6855ff7e2f2a7a65')

build() {
  R CMD INSTALL ${_pkgname}_${pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
