# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vrf-decompiler"
pkgname="${_pkgname}-bin"
pkgver=12.0
pkgrel=1
pkgdesc="File data viewer and decompiler for Valve's Source 2 resource file format"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://valveresourceformat.github.io"
_url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/${pkgver}/cli-linux-arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${_url}/releases/download/${pkgver}/cli-linux-arm.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/${pkgver}/cli-linux-x64.zip")
b2sums=('8865f645644d3b858270a2672e5756a7ed2d605b656c170dc6df5203f04437c88d1d0360a5af1b36a1c65a17f716e496c7e360b6b63f0c0ad13dd8018dce98a4'
        '779dcb6725621298d472968b5e8445653141f9c5a28bc0a82e17f760961258bcafc0d3357a7c5bc5d079ce21ff1824827114b695d9ae9a5d205587fd5649080a')
b2sums_aarch64=('6f46b2aa4499f442f398a71ba9370841a13f4f31b35bb970e92cf2a3a0fee5f17b68f225a351b85c3a2ac3ac13482af0d2f2f6869bac7f0569c6444a381ffc73')
b2sums_armv7h=('7e741030c0ca876a9628627cacf3fb72895959ffb6282d69d0b1b4ae127b07017785ae3c0a0942e7bde42e86d32e07a396ecb34ee5d4be66d8b4d3b3296ba1a1')
b2sums_x86_64=('7f77a20846fb924dca975289a9961a03457f5dfda991ad2daf58f0f06d557fe85561f425ea0005434eee4168f7c27b14689dbb0f7f801b55aa8b0f73525b9000')

package() {
  cd "${srcdir}"
  install -vDm755 "Source2Viewer-CLI"    "${pkgdir}/usr/bin/Source2Viewer-CLI"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ln -vsf "/usr/bin/Source2Viewer-CLI"  "${pkgdir}/usr/bin/${_pkgname}"
}
