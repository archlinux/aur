# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="dtk"
_pkgname="decomp-toolkit"
pkgname="${_pkgname}-bin"
pkgver=1.6.2
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
        "${_pkgsrc}-LICENSE-APACHE::${url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_binname}-linux-aarch64")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_binname}-linux-i686")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_binname}-linux-x86_64")
sha256sums=('38820d0f90a5155446699e46e0d0feb93e12b839c9bf3556361827cbca5dd1cd'
            '544ffe9befaefa6b59ab1fdde58789069ba7c1b65432bdea273a16b2117909b7'
            'fd363f1eb5135402a2e66f4a6173e6eff06daabe79d150acd7c669d33b985b4e')
sha256sums_aarch64=('6d993aed33796c0569eb746caa1a301153dec6a595c8668c37ce2469a5dd25d0')
sha256sums_i686=('8e6a9b61c2a82d20e43ef037d4d31a146e7427c70909f8e65f799dedf758c503')
sha256sums_x86_64=('dcce37ed9851efdfde7a4c907df74507a9866df3290771ae8a9e948363e00bc4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
