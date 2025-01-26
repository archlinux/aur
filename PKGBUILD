# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vrf-decompiler"
pkgname="${_pkgname}-bin"
pkgver=11.1
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
source=("README-${pkgver}.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/${pkgver}/cli-linux-arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${_url}/releases/download/${pkgver}/cli-linux-arm.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/${pkgver}/cli-linux-x64.zip")
b2sums=('8865f645644d3b858270a2672e5756a7ed2d605b656c170dc6df5203f04437c88d1d0360a5af1b36a1c65a17f716e496c7e360b6b63f0c0ad13dd8018dce98a4'
        '779dcb6725621298d472968b5e8445653141f9c5a28bc0a82e17f760961258bcafc0d3357a7c5bc5d079ce21ff1824827114b695d9ae9a5d205587fd5649080a')
b2sums_aarch64=('c6854fdcfaf23a2573273e6d397e96be770831fa8673da2f115cfcce8431bebb503f66cc9d5f1f9c68e0d61b005494cfc1f6ef929ac8730760712cda62332935')
b2sums_armv7h=('2cb96fee33faf0bbc9fc8b9a17018c8f01caad18afc6425865e21e26705174f8aee6a3e9d1e8e367dfaf62bbeee94f5400c70319078b28581c68f80ed86c4bfd')
b2sums_x86_64=('aa36f4c298f1140a714265a1ce954b1738dbe3e7dcfb24c05a49c5de5944ccd2fc923a5e4943bfda3679f79231bba3dafb0e95af57fe9499f4fcb536745942fc')

package() {
  cd "${srcdir}"
  install -vDm755 "Source2Viewer-CLI"   "${pkgdir}/usr/bin/Source2Viewer-CLI"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ln -vsf "/usr/bin/Source2Viewer-CLI"  "${pkgdir}/usr/bin/${_pkgname}"
}
