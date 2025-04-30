# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="urlfinder"
pkgname="${_pkgname}-bin"
pkgver=0.0.3
pkgrel=1
pkgdesc="High-speed tool for passively gathering URLs, optimized for efficient and comprehensive web asset discovery"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('6af33108d6b76bbd261fa696c69dccf44b9eb5a68dc47b4c41df5cf32f8b8281')
sha256sums_armv7h=('726079d945ca1adca43248f8048a2254a99c40f132b71e3cffd54502b764f41c')
sha256sums_i686=('937da53500a1a297f44ca7353dad7e5d5839d7589a280d6d63cec4d41ce9275e')
sha256sums_x86_64=('655ea7378a0555149831dcc4c3f6aef34f3ce27eda0ce2f2721e2ca5526015d4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
