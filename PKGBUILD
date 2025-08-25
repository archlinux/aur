# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="html2markdown"
pkgname="${_pkgname}-bin"
pkgver=2.4.0
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
sha256sums_aarch64=('52d45368d6dd8e770f4a75cd89c44dbcea99c8b344a2d2ea7025ebfcbc5c91bd')
sha256sums_i686=('fef965b92c2075f6853d7b82c6629f3a386346a0ca274db973a261993a009d9c')
sha256sums_x86_64=('ed22e7c6de1c1ec166e2026b4d18519b4151b15d41606362c2d7e8981ad1528d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
