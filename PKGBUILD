# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tartrazine"
pkgname="${_pkgname}-bin"
pkgver=0.27.2
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
sha256sums=('fdfe4b63934f8b7643adf0eec5e53313e96f03fb6528356ed52e5b093cce08ee'
            '3a73bd3f0ce4dfed29e17af2bf13e33adeb05cf9eabd1f3af18359bbc92d9cac'
            'dbbffa23a676d422aa7460b468c731e4fe3a007414e14d787a3d3f3fb55b1713')
sha256sums_aarch64=('f9adcca6be48a8d690fce3a7bd1235e65ca5b885666ae2abcbb133e99a0e2f95')
sha256sums_x86_64=('9f18286455336cf6864de981fae55ae4f0385143257a81dbe4d89c53b3f42e6c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"     "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
