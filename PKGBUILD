# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="radiogogo"
pkgname="${_pkgname}-bin"
pkgver=0.4.2
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
sha256sums_aarch64=('4271ff5148b778f147af72c0469349d5874401514fdc80d19d84f08b9262695c')
sha256sums_armv6h=('f5955b0e876ca394e6884f09a0a0d04bb30f3d00db5e76628856af4fc129d14c')
sha256sums_armv7h=('3ab2548f73d5603f1dc6295eea6febb36a99dc06a3a7e8fcd28069e6d6a0802e')
sha256sums_i686=('9f6b597030eaaa2c1ae31b9ee40e358425706da099ffedb022f22e85052e2a19')
sha256sums_x86_64=('420635cf35227c5f359cbb6832aa49b733ee4af5d9c9e751ecc9621e905baaaf')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
