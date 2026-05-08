# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="html2markdown"
pkgname="${_pkgname}-bin"
pkgver=2.5.1
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
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-ESCAPING.md::${_url}/raw/refs/tags/v${pkgver}/ESCAPING.md"
)
source_aarch64=(
  "html-to-markdown_${pkgver}_Linux_arm64.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_arm64.tar.gz"
)
source_i686=(
  "html-to-markdown_${pkgver}_Linux_i386.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_i386.tar.gz"
)
source_x86_64=(
  "html-to-markdown_${pkgver}_Linux_x86_64.tar.gz::${_url}/releases/download/v${pkgver}/html-to-markdown_Linux_x86_64.tar.gz"
)
sha256sums=('74545f65ae3774ef2fe4ecc48b208305929860e95cfda3f227bc4eb507e8e5b4')
sha256sums_aarch64=('dfcb6623c49a59600a38957a4be783314f9732948a69c42409fbb125021a4773')
sha256sums_i686=('72f5319eb6a4c57c33e3578d73c9cb19bfcfc55da6c1a9c20de1bc02aba52744')
sha256sums_x86_64=('2d6be8c6d155c60b06254dd8b999cd0b114d1a05bf7eac511ed60cfeb012f087')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-ESCAPING.md" "${pkgdir}/usr/share/doc/${_pkgname}/ESCAPING.md"
}
