# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="ghfs"
_pkgname="go-http-file-server"
pkgname="${_pkgname}-bin"
pkgver=1.20.1
pkgrel=1
pkgdesc="Simple command line based HTTP file server to share local file system"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64' 'i686' 'armv7h')
url="https://github.com/mjpclab/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-amd64v2.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm64.zip")
source_riscv64=("${_pkgsrc}-riscv64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-riscv64.zip")
source_loong64=("${_pkgsrc}-loong64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-loong64.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-386.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm.zip")
sha256sums=('4fe36fd9dcee9c99fa5bcef7f5d49a87b7b8383a257ce415cfbde7e37e1d25e7')
sha256sums_x86_64=('58b2f3f6e714c465718279de48b20b314477d269cb04072c0644e6eb1b713b3f')
sha256sums_aarch64=('a717921c0c70c1bc50cfa5be00a7292ace001337fca61ae29b4c335a1ece46b0')
sha256sums_riscv64=('b02b85e106a6237412e697d506c4c89540192d65192e1bbbffecb5605c420704')
sha256sums_loong64=('e39e44bd01ea667387ab7452490c649d1cb5cdfa1c22d997237a7d26b340ba84')
sha256sums_i686=('79f92dc9f6add32534f79ced9f195ea370f5d1f18c7ca8dcf2c0ac702d4697fa')
sha256sums_armv7h=('5a0c844b50b008f9dcb853b706d3c9b94b71a6b9174c12240fec8a85dbf9b060')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
