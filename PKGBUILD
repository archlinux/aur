# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cwdemangle"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="CodeWarrior C++ symbol demangler"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/encounter/${_pkgname}"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE-MIT::${url}/raw/refs/tags/v${pkgver}/LICENSE-MIT"
        "${_pkgsrc}-LICENSE-APACHE-2.0::${url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64")
source_i686=("${_pkgsrc}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-linux-armv7l")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64")
sha256sums=('056a1c96d253f348af5e87ac92bcf5d6868dbe5da8536d32ae42a44da847e781'
            '544ffe9befaefa6b59ab1fdde58789069ba7c1b65432bdea273a16b2117909b7'
            'fd363f1eb5135402a2e66f4a6173e6eff06daabe79d150acd7c669d33b985b4e')
sha256sums_aarch64=('f208bb1f3d7999f85cdedb90e0905070bfb566b493fe75506cec6f4cf6041c40')
sha256sums_x86_64=('f3967cfa4150cf6822172014a4e7961f3fd35cb4b7f7b0e2e5fa43115e902ae1')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
}
