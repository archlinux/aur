# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.22.0
pkgrel=1
pkgdesc="HTTP download manager with multi-parts"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/vbauerster/${_pkgname}"
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums=('71d6fc3787af918e3eea9c74241dd6b13d5ceaa5d7f6920a330f87eb310ad0a6'
            '05825076a9292282160131e3644317e5977c13c414144e76c6658008c78989cd')
sha256sums_x86_64=('871bff57c1fc42b5a133ecae101c173834d2df62845f0b65170b7b218b6bf91c')
sha256sums_i686=('42298b204dd9b55c5621b44e38da79018f653184c63d59da31d0a3d7b9f84b02')
sha256sums_aarch64=('5143033cdb5958b0ebabdbbdc5c6791b3ea203e3561e90247d11c0360226125b')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
