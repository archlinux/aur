# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="html2markdown"
pkgname="${_pkgname}-bin"
pkgver=2.3.1
pkgrel=1
pkgdesc="Convert HTML to Markdown. Even works with entire websites and can be extended through rules."
arch=('aarch64' 'i686' 'x86_64')
url="https://html-to-markdown.com"
_url="https://github.com/JohannesKaufmann/html-to-markdown"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_x86_64.tar.gz")
sha256sums_aarch64=('70bc2ba32699c4bfab81f18a77a8ab7ea60e2c66f5382136bdaced60622f9a62')
sha256sums_i686=('47a389ced435772abab9d23f44bc7f75611d407f4d087c1af441e3784cc33c1d')
sha256sums_x86_64=('cf18f959179c8e4ecbd93ec3027976fa21b93d88c5d88ca25acb90d6d556fdbb')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
