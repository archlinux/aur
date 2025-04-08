# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.23.2
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
sha256sums=('5dbfa092831573c2afc347d0feba84c8a759544ce2648b04953947c9edd5ebfc'
            '7eae4b517298f40842bed72893aee2fb1a45ea368e2ad0951bad3c6062608c83')
sha256sums_aarch64=('34e09ef27473a54eda7f1b13b6965bb862bd551ee01d79ab536accab1329f1c9')
sha256sums_i686=('bb9174c5b759c6b739e070af4f6060a084f6a738968afa4b201352d7a31f32ae')
sha256sums_x86_64=('888cc86582d7334ed8bb58fa5457ffb857ba0978762822cc345eacfbf90e0d0e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
