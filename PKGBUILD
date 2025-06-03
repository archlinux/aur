# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vrf-decompiler"
pkgname="${_pkgname}-bin"
pkgver=13.0
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
b2sums=('86c18d3564b4d114c84a054934aa6bb1a6b6f4c49575a5c8ad6069c6dde4f23f43a17c10d768e95fc999402799a798e708b3fd06534b28ec57b46bbc7f7654ac'
        '779dcb6725621298d472968b5e8445653141f9c5a28bc0a82e17f760961258bcafc0d3357a7c5bc5d079ce21ff1824827114b695d9ae9a5d205587fd5649080a')
b2sums_aarch64=('10ed3f439d8b96449a4060891b4c16a9ae39972dd06369d2becd72ad301821717367cac8b93e8682409f7c5a8c727f07653ff9b3fe21b88fe7c074b49b878f1e')
b2sums_armv7h=('fca1731e22302cc0fcd6c6540715f7488d971989b9608d50d6ac7b8124df02f14ee66f01c4c5c195b74fccaa500c862c57ac7e92d1d1d872738efc8d4a9865e9')
b2sums_x86_64=('44b111ad0b89acffc43d809118f8a24cac44b7eaf905fdf2842d4bb62faa4c9765d2f2cb1b6b2d28cc45ddb881b7bcf117aa20d3e25d3aeeecd1af8b1ec234cb')

package() {
  cd "${srcdir}"
  install -vDm755 "Source2Viewer-CLI"    "${pkgdir}/usr/bin/Source2Viewer-CLI"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ln -vsf "/usr/bin/Source2Viewer-CLI"  "${pkgdir}/usr/bin/${_pkgname}"
}
