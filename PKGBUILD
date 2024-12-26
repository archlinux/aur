# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="rb"
_pkgname="revbayes"
pkgname="${_pkgname}-bin"
pkgver=1.2.5
pkgrel=1
pkgdesc="Bayesian Phylogenetic Inference Using Graphical Models and an Interactive Model-Specification Language https://doi.org/10.1093/sysbio/syw021"
arch=('x86_64')
url="https://revbayes.github.io"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "NEWS-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/NEWS.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux64.tar.gz")
sha256sums=('5c723bb7bcec0dbb1659a9cfde5cb6bd65b87164912e47a827f757bcaa627dbf'
            '4529871f7202451a393e83ee8ae53d6e69c1b9d396ee96cbc652ac764843cacb'
            '12ac5047f2af0522f06798b1589ffc4599bc29c91f954d7874e0320634e777c0')
sha256sums_x86_64=('bfcc7718759a875c614a96cd2c0e2080f98dc599a6166858317cb3ea284e4327')

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "NEWS-${pkgver}.md"   "${pkgdir}/usr/share/doc/${_pkgname}/NEWS.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-v${pkgver}/bin"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
