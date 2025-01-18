# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="asciigen"
pkgname="${_pkgname}-bin"
pkgver=1.0.6
pkgrel=1
pkgdesc="Convert images/video to ASCII art"
arch=('x86_64')
url="https://github.com/seatedro/${_pkgname}"
license=('MIT')
depends=('ffmpeg6.1' 'glibc') # 'ffmpeg4.4'
# makedepends=('patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/readme.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('3e7dd0d446fc47105962709ca8ea1ae4ca6bf2f90cbe0e13a3aa3eefa7efebc0'
            '0e524e617c46da5a37455d17e4bf573b955e4c1dab1b1f657a27aa0c29f4cd15')
sha256sums_x86_64=('23c256647c0cfbf479bfa349972ceec03537c7da9e0626ff1f7f6dcaf6943ffe')

# build() {
#   cd "${srcdir}"
#   patchelf --replace-needed 'libavcodec.so.60'  'libavcodec.so'  "${_pkgname}"
#   patchelf --replace-needed 'libavformat.so.60' 'libavformat.so' "${_pkgname}"
#   patchelf --replace-needed 'libavutil.so.58'   'libavutil.so'   "${_pkgname}"
#   patchelf --replace-needed 'libswscale.so.7'   'libswscale.so'  "${_pkgname}"
# }

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
