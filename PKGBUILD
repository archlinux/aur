# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="html2markdown"
pkgname="${_pkgname}-bin"
pkgver=2.5.0
pkgrel=1
pkgdesc="Convert HTML to Markdown. Even works with entire websites and can be extended through rules."
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://html-to-markdown.com"
_url="https://github.com/JohannesKaufmann/html-to-markdown"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-ESCAPING.md::${_url}/raw/refs/tags/v${pkgver}/ESCAPING.md"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_arm64.tar.gz"
)
source_i686=(
  "${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_i386.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_x86_64.tar.gz"
)
sha256sums=('74545f65ae3774ef2fe4ecc48b208305929860e95cfda3f227bc4eb507e8e5b4')
sha256sums_aarch64=('3ef28c5e030986e9b082b42984178692136258381f66e3208218a17a3278cee4')
sha256sums_i686=('a7b1c67961d55a3b28a05ea573949473c1428a8c2eab561731f0fdbfcc83f439')
sha256sums_x86_64=('0c741a0949c255fec6f693796fcbda564120e459a66251364f0d2a50c3b1047b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-ESCAPING.md" "${pkgdir}/usr/share/doc/${_pkgname}/ESCAPING.md"
}
