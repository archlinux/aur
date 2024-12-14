# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=vscDebugger
pkgname=r-${_pkgname,,}
pkgver=0.5.3
pkgrel=2
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
sha256sums=('54db35c889e24f16c3cd591f8e2e7f81f1b3c465b4e177f43372d9119412cd10'
            '54ee5b8054493e7cd776fded707521874c45a87b945fc1bf518e4e263132541c')

build() {
  R CMD INSTALL ${_pkgname}_${pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
