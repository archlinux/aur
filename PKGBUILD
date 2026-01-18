# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="dtk"
_pkgname="decomp-toolkit"
pkgname="${_pkgname}-bin"
pkgver=1.8.0
pkgrel=1
pkgdesc="A GameCube & Wii decompilation toolkit"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/encounter/${_pkgname}"
license=(
  'MIT OR Apache-2.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE-MIT::${url}/raw/refs/tags/v${pkgver}/LICENSE-MIT"
  "${_pkgsrc}-LICENSE-APACHE::${url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_binname}-linux-aarch64"
)
source_i686=(
  "${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_binname}-linux-i686"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_binname}-linux-x86_64"
)
sha256sums=('38820d0f90a5155446699e46e0d0feb93e12b839c9bf3556361827cbca5dd1cd'
            '544ffe9befaefa6b59ab1fdde58789069ba7c1b65432bdea273a16b2117909b7'
            'fd363f1eb5135402a2e66f4a6173e6eff06daabe79d150acd7c669d33b985b4e')
sha256sums_aarch64=('f18219e42b26e57af22ec288a1eabb9a8f3c89f5c8b4d20fd25fee3ea4676de0')
sha256sums_i686=('4dd588e4893b6d6d9af20119d8a988c6c0bca6ac9dd6623070f0e0be7828ae5b')
sha256sums_x86_64=('8cec6ee04955135cceb872802ddf4471655642de09b97113ced34f45c45c218b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"

  ln -vsf "${_pkgname}" "${pkgdir}/usr/bin/${_binname}"
}
