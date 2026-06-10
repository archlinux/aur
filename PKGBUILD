# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="html2markdown"
pkgname="${_pkgname}-bin"
pkgver=2.5.2
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
sha256sums_aarch64=('4fc380e0fd86c333e2168bb703eaddbfbbefe19c93be144ae6a5a239d50042bc')
sha256sums_i686=('d764daff79d467a7ea8f3bc1288641f718f3a42b3a78e4aa41ad5eab99241979')
sha256sums_x86_64=('337588fd2f15b87869f1ad608506ab6b9ff5f65cf4cb33509ae07ab2852d5f80')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-ESCAPING.md" "${pkgdir}/usr/share/doc/${_pkgname}/ESCAPING.md"
}
