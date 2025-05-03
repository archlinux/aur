# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="rb"
_pkgname="revbayes"
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="Bayesian Phylogenetic Inference Using Graphical Models and an Interactive Model-Specification Language https://doi.org/10.1093/sysbio/syw021"
arch=('x86_64')
url="https://revbayes.github.io"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-NEWS.md::${_url}/raw/refs/tags/v${pkgver}/NEWS.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux64.tar.gz")
sha256sums=('d817ab410d3543fde449066402375e8c443d52041b2ea087b8b56e0eea11d1e1'
            'df780d2951a96013f690dda6f669c913f7e31f06a62793ea90bd9227562c2cc7'
            '12ac5047f2af0522f06798b1589ffc4599bc29c91f954d7874e0320634e777c0')
sha256sums_x86_64=('b6677acbc56d782c5db1a4d16fea55c90fbc238ed5103641092718c76cb2d14e')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-NEWS.md"   "${pkgdir}/usr/share/doc/${_pkgname}/NEWS.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-v${pkgver}/bin"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
