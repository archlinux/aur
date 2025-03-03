# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="glyph"
pkgname="${_pkgname}-bin"
pkgver=1.0.8
pkgrel=1
pkgdesc="Convert images/video to ASCII art"
arch=('x86_64')
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
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('80b73f83fad3f3323ea66ca3f2c847fb90e3d6ac18cd4b2764a8191af45ce7fe'
            '0e524e617c46da5a37455d17e4bf573b955e4c1dab1b1f657a27aa0c29f4cd15')
sha256sums_x86_64=('dd617ed7e12f37cfc0850b10713fe89117acc15c1e077ba7a221f12a8948a2c2')

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
