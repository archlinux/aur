# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tenere"
pkgname="${_pkgname}-bin"
pkgver=0.11.3
pkgrel=1
pkgdesc="TUI interface for LLMs written in Rust"
arch=('x86_64')
url="https://github.com/pythops/${_pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
sha256sums=('4f9b9a80b5a1fc61fea53e24c6e373eb2604019965fa84e2c5d13a43cbd63e83'
            'fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0')
sha256sums_x86_64=('713d56ec867fb48d9b2b026a7e0bf04d831cfd59e46b7eaf06835ff2a85389bc')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
