# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tartrazine"
pkgname="${_pkgname}-bin"
pkgver=0.21.1
pkgrel=1
pkgdesc="A Crystal reimplementation of the Pygments/Chroma syntax highlighters"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/ralsina/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-CHANGELOG.md::${url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-arm64"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-amd64"
)
sha256sums=('887019bf298de9409bece3447a25758baabf546bcdffac490d63007efc16ec2b'
            '0832d35f478bfa74aea707443fcc87aeae50a0f20900d8e9f04fd4bfa01efdf3'
            'dbbffa23a676d422aa7460b468c731e4fe3a007414e14d787a3d3f3fb55b1713')
sha256sums_aarch64=('395fd4a64666ba49d4ad7bfd7cb79097297a240b4da407eaf9f99fb781f6aa27')
sha256sums_x86_64=('4077eab774721fee41d1b6c34561ab3c070edf32131939940c7b19a7a97d42f3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"     "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
