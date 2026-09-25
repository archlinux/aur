# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="dtk"
_pkgname="decomp-toolkit"
pkgname="${_pkgname}-bin"
pkgver=1.8.4
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
sha256sums_aarch64=('889a551d57916772f21a29c997579e0508f268c96bcbc946a0a66bff029cf97c')
sha256sums_i686=('10faa85d4d7e0175badf198011ac3b5856ff89d85c0cc536dbdce1adfeeb4cf8')
sha256sums_x86_64=('7c86b1994401bde0cad1d308e6c04cccb65e85453ccc5062ac12baab3b03d320')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"

  ln -vsf "${_pkgname}" "${pkgdir}/usr/bin/${_binname}"
}
