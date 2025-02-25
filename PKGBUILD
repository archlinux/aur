# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.23.1
pkgrel=1
pkgdesc="HTTP download manager with multi-parts"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/vbauerster/${_pkgname}"
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums=('b07fd3cbdd4e4fb7aeb86671ed570d13c96f02529f08a646961ed5d639a555d0'
            '7eae4b517298f40842bed72893aee2fb1a45ea368e2ad0951bad3c6062608c83')
sha256sums_aarch64=('4cdc5da5f0daf2f5a2ae1c1bfbf219bd55c92773d4f4713a472bf1623a087f37')
sha256sums_i686=('ba5a14069d3e522938f3590ce79a025b8ff4109fb0784d782b2d909d1bf1b325')
sha256sums_x86_64=('f42a63f090dcc634270ebc2990e8ac7fc75627ff5b6b5467e436d9bcfe1b94a4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
