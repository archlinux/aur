# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.24.0
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
sha256sums=('833da256d97a7126b0a236e20a5b636a3080c716f94aad17a76ae0a30f7afc30'
            '7eae4b517298f40842bed72893aee2fb1a45ea368e2ad0951bad3c6062608c83')
sha256sums_aarch64=('9d1cce8465e9eb706ddd8d8cd0ad412fe73f8f36c6eb084a7c2dada9ff98dfaa')
sha256sums_i686=('d14ddaa199e077217a9be40c009a0d6f4b68f086e78a35748820c624eb551639')
sha256sums_x86_64=('db7a04fd974e9ed128db95e8ab449a3d0ae2b5a407d5bbb8fe26982d8071307b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
