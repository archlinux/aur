# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="ghfs"
_pkgname="go-http-file-server"
pkgname="${_pkgname}-bin"
pkgver=1.20.2
pkgrel=1
pkgdesc="Simple command line based HTTP file server to share local file system"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64' 'i686' 'armv7h')
url="https://github.com/mjpclab/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-amd64v2.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm64.zip")
source_riscv64=("${_pkgsrc}-riscv64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-riscv64.zip")
source_loong64=("${_pkgsrc}-loong64.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-loong64.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-386.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm.zip")
sha256sums=('1cdba1538e86e2017cdadcc53e17a353ae08a3f4a07a08859574c67edfbdfd8c')
sha256sums_x86_64=('dce0e5f66443867fd39000185865a96a744f9dd1fa4688b560cd469bb96a17da')
sha256sums_aarch64=('77e3d623141e626b2962bf90b621b5455e2a6e602aebeed011967c88c2f1de3d')
sha256sums_riscv64=('76cd038962f9565c2f840b255f11ccbf84b6cf816c324eb5221a246ccfeb1902')
sha256sums_loong64=('76eb9129f70870eb17f6f04eea715c9befc312ec5626e95254593b7bc2d71e21')
sha256sums_i686=('9e7f8df7b8da59bbc7b32c59e9c79d42aa7446013721a0e98382362f3260ce9f')
sha256sums_armv7h=('8a3f68f59c005a7b0149eb54938e8f3a37e3dc099e712def8257336051c12a38')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
