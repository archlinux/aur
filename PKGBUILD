# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="zlint"
pkgname="${_pkgname}-bin"
pkgver=0.7.9
pkgrel=1
pkgdesc="A linter for the Zig programming language"
arch=(
  'aarch64'
  'x86_64'
)
url="https://donisaac.github.io/zlint/"
_url="https://github.com/DonIsaac/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64"
)
sha256sums=('2477ab33e461d9a85f7d3ff54488807bd539d1b01b553788cded68d1880aa281'
            'a89d2e30b1274825cab7822156fa5c9d6fafe3c1724e6e05d675e064fd118423')
sha256sums_aarch64=('fb73191c680ac9303605ba8a05974f06827c980ea593316abc00934c6bd17faf')
sha256sums_x86_64=('388c501bfb8ffe0e4ffb5ac633b71c1b74e4465a0d1cf8cb2f23f99b08299a29')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
