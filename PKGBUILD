# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="dtk"
_pkgname="decomp-toolkit"
pkgname="${_pkgname}-bin"
pkgver=1.7.5
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
sha256sums_aarch64=('9f08f0a3350e2012c06fefabdd2fa48f7e65706b986504892b7fb4518f05733f')
sha256sums_i686=('4c67be33495f301d10eebb14f8d48f70523fdca2cf28c1594988f4f1b2f33dee')
sha256sums_x86_64=('ec5adb5ed0ecd65d01a937f7455000a0ee401e9a5262fa4933e0cbf564ccc743')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
