# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kyanos"
pkgname="${_pkgname}-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="Visualize the time packets spend in the kernel, watch & analyze in command line"
arch=(
  'aarch64'
  'x86_64'
)
url="https://kyanos.io"
_url="https://github.com/hengyoush/${_pkgname}"
license=(
  'Apache-2.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums_aarch64=('55a68147be183c71f1e734f2482704c315ae0e5a6b8bb8ef31bbf8e0840a2175')
sha256sums_x86_64=('66df07b972a0e970bf5365a702a852ad4f78f5dd787d4a33f82c7983fa7daddb')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "README_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_CN.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
