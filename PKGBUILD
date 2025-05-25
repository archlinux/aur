# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="html2markdown"
pkgname="${_pkgname}-bin"
pkgver=2.3.3
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
sha256sums_aarch64=('c3638964e5611904914fbb631a6d597ea38ccfb4ab266cf25856a820957e0491')
sha256sums_i686=('9f96f39a258998d4da1a7b5a7ba2b460b906c05dd7836c6e46bdf5a64fca048c')
sha256sums_x86_64=('e817712500628996ff15e5d3475462856ba3b606e04b6992946872ebf5ac173a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
