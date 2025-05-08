# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="glyph"
pkgname="${_pkgname}-bin"
pkgver=1.0.11
pkgrel=1
pkgdesc="Convert images/video to ASCII art (formerly asciigen)"
arch=('aarch64' 'x86_64')
url="https://github.com/seatedro/${_pkgname}"
license=('MIT')
depends=('ffmpeg6.1' 'glibc')
# makedepends=('patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=('asciigen-bin')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/readme.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('d0d5f4f40e9bc27c486714ae8289987f3705ef726965996b9a67275acd6ca251'
            '0e524e617c46da5a37455d17e4bf573b955e4c1dab1b1f657a27aa0c29f4cd15')
sha256sums_aarch64=('88fe83ff66b3156124b7e051b352bc37f73bfee6a696173902d69f972d6a6809')
sha256sums_x86_64=('e18de7503bd73433d7a808bc6ae93e1fab1aa74d6c6392e8b1e8d5aea3b2f4d4')

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
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
