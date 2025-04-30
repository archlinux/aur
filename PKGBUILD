# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="asnmap"
pkgname="${_pkgname}-bin"
pkgver=1.1.1
pkgrel=1
pkgdesc="CLI for quickly mapping organization network ranges using ASN information"
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
sha256sums_aarch64=('c574615ce5bcfa33c32b582b4b76508881e791b69034a5faee9b7e27f87dda67')
sha256sums_armv7h=('62ef15a5339d52b75022d2afb40962c75f8d0d07a6e53ac93be0d1c367abaa6f')
sha256sums_i686=('a52d2f0df943b60ef2674d2c8ea2a0f43bda147605044b7053a892645cb7bdad')
sha256sums_x86_64=('8a2cc589f40794b4b8d19ecafbbbd0682ec38785410d7efde2f7429e2fe3b621')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
