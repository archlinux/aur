# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="radiogogo"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="Go-powered CLI to surf global radio waves via a sleek TUI"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/matteo-pacini/RadioGoGo"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv6h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.zip"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums=('f72bb27168b92cc356541010e84204df6e7e60bbab45814069f8ac1db80d9b95'
            '133e7fe753e0ab27fa19a01aa7710821442c19e80024642b190adbdd2d9c97d2')
sha256sums_aarch64=('ef7f7da3b4e1d9199f0b4cef0e3531dc319f3971881da4581bae57651f9d3bbf')
sha256sums_armv6h=('b58f064adc1f1cc946fd363484b814ac27f37941211b545e70abf974dcc6173f')
sha256sums_armv7h=('e5e2e8cfed099e8c4c1b7ffefb4d53e5087a9798664255ed49c18ec75446b4f8')
sha256sums_i686=('e1cdda5bd6c5e8562f303163c1b948af326d9a11f0aa2017e8bd536a6895e325')
sha256sums_x86_64=('a9fe2e3e743f4bb74ce32939a84698d066457b5bfe3e63a54af98b0f96c35f30')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
