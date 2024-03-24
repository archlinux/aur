# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=vscDebugger
_pkgver=0.4.7
pkgname=r-${_pkgname,,}
pkgver=0.5.3
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
source=("https://github.com/ManuelHentschel/vscDebugger/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}.tar.gz"
        "LICENSE::https://github.com/ManuelHentschel/vscDebugger/raw/master/LICENSE.md"
)
sha256sums=('a0b863f1c9a06eb5454cbd90e07946c8032cf6e466ad6da37b3ef99547723575'
            '54ee5b8054493e7cd776fded707521874c45a87b945fc1bf518e4e263132541c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
