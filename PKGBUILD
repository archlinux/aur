# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tartrazine"
pkgname="${_pkgname}-bin"
pkgver=0.26.4
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
sha256sums=('cbe8d82937db5e897c9b9405b4204306095c28776b8240b7774761317fe2c8af'
            '6edf5f2e88b0e2772000eb7fc207bef0f37b300186fc89fa9e96d518c8496549'
            'dbbffa23a676d422aa7460b468c731e4fe3a007414e14d787a3d3f3fb55b1713')
sha256sums_aarch64=('3edc2dccbe4c3386662716e2e986a38a657eebc15bdbe91bb93357b4f6b6252d')
sha256sums_x86_64=('373526a5c388e8e2ce68f540eb93349c5d010c71d91964b6aa95ab3314fe3b22')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"     "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
