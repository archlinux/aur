# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="superhtml"
pkgname="${_pkgname}-bin"
pkgver=0.5.3
pkgrel=1
pkgdesc="HTML Language Server & Templating Language Library"
arch=('aarch64' 'x86_64')
url="https://github.com/kristoff-it/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/aarch64-linux.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/x86_64-linux-musl.tar.gz")
sha256sums=('1554bb910b345c4f8ff5ad689057ff78b3c95c1b1ce1b3447d81bb2fc44797f7'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('54cd2414de6664b85166a0a2e7c208ca3dbcc935274f4a55309cc9dcfa8e605b')
sha256sums_x86_64=('c9fabbbd57851e38a67e6c1eb7942e8bc6189925bfcf437f1e5286932c76d60a')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${CARCH}-linux"*
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
