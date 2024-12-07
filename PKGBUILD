# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ictree"
pkgname="${_pkgname}-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="Like tree but interactive"
arch=('x86_64')
url="https://nikitaivanovv.github.io/ictree"
_url="https://github.com/NikitaIvanovV/${_pkgname}"
license=('GPL-3.0-or-later')
optdepends=('xsel: for copying selected item into X clipboard'
            'wl-clipboard: for copying selected item into Wayland clipboard')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-v${pkgver}.tar.gz")
sha256sums=('9a9dc121d2cd013b819046888902405ff0a90ec736cca99e3e87feea99d1a7f5'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('3496adfd4cca03c9ef52e234249146a3401d0777a9ac3dc6906d03222c711939')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}