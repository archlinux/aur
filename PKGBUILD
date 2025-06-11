# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: simonsmh <simonsmh@gmail.com>

_pkgname="okteto"
pkgname="${_pkgname}-bin"
pkgver=3.8.0
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('aarch64' 'x86_64')
url="https://www.okteto.com"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0')
optdepends=('kubectl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64")
sha256sums=('fba840aa6fee097cb78812e407de022bfa31c9bac7814fe95a6b95820fa2cf31'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('9c068886fad900abf409c52bc6b4fb1a2bc98bbac8369178f525294c3ec8fd52')
sha256sums_x86_64=('08c2f5530c4539c0105bf97d56c10ad17aa74a4c09bf17b7c9f99ca06a35634e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
