# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="dtk"
_pkgname="decomp-toolkit"
pkgname="${_pkgname}-bin"
pkgver=1.5.1
pkgrel=1
pkgdesc="A GameCube & Wii decompilation toolkit"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/encounter/${_pkgname}"
license=('MIT OR Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE-MIT::${url}/raw/refs/tags/v${pkgver}/LICENSE-MIT"
        "${_pkgsrc}-LICENSE-APACHE-2.0::${url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_binname}-linux-aarch64")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_binname}-linux-i686")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_binname}-linux-x86_64")
sha256sums=('c645db74482a42a77b2d761599414d7d9df1bd5abd78e162aff7b71a210692d2'
            '544ffe9befaefa6b59ab1fdde58789069ba7c1b65432bdea273a16b2117909b7'
            'fd363f1eb5135402a2e66f4a6173e6eff06daabe79d150acd7c669d33b985b4e')
sha256sums_aarch64=('7827362119244566e41d83c08eb56dcd463447211d28e94146883d92f98e68de')
sha256sums_i686=('ca20aa090c4043a6aa1a26851e968bb476f4f14e911c098f4b4b071e07e9e676')
sha256sums_x86_64=('0b186089012d3352cadf341b0ccb82bb17da023ea58db1e0109a302fde7b7730')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
}
