# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nodtool"
pkgname="${_pkgname}-bin"
pkgver=1.4.4
pkgrel=1
pkgdesc="CLI tool for reading GameCube and Wii disc images"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/encounter/nod"
license=('MIT OR Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE-MIT::${url}/raw/refs/tags/v${pkgver}/LICENSE-MIT"
        "${_pkgsrc}-LICENSE-APACHE-2.0::${url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}-linux-i686")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64")
sha256sums=('92335e0cc57c03d4397c4aacb49caebc203a94185907f7e38abc4abeb68bf392'
            '544ffe9befaefa6b59ab1fdde58789069ba7c1b65432bdea273a16b2117909b7'
            'fd363f1eb5135402a2e66f4a6173e6eff06daabe79d150acd7c669d33b985b4e')
sha256sums_aarch64=('4180f9501dc0de2fb4841c865604fad91899798280f49015e7be8f89890ee37e')
sha256sums_i686=('044b3ed090bf43250fc507854a4d87bd310e64705a5ac9f9a5dac2de0b94a468')
sha256sums_x86_64=('cf20828d1a437ca14ed7acfd5545e1a0e62c082f5a77240a399aa4f172119fc4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
}
