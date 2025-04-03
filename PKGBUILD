# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="ghfs"
_pkgname="go-http-file-server"
pkgname="${_pkgname}-bin"
pkgver=1.20.3
pkgrel=1
pkgdesc="Simple command line based HTTP file server to share local file system"
arch=('aarch64' 'armv7h' 'i686' 'loong64' 'riscv64' 'x86_64')
url="https://github.com/mjpclab/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm64.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-arm.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-386.tar.gz")
source_loong64=("${_pkgsrc}-loong64.tar.gz::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-loong64.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-riscv64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_binname}-${pkgver}-linux-amd64v2.tar.gz")
sha256sums=('1cdba1538e86e2017cdadcc53e17a353ae08a3f4a07a08859574c67edfbdfd8c')
sha256sums_aarch64=('fcf79b7f9d6bb3c7c07aa8fb5a0ca19ed1fcf0f42b94abb7eb6c400567f5309d')
sha256sums_armv7h=('ce67304280146a87b1d6fc8c5e95d0b1e6a7dd3695a47455910e7d7b6b33e0c3')
sha256sums_i686=('a2901b310828ff0371dc01fea174559906e7dbb83cc7b8218b2ae8bfd95eec58')
sha256sums_loong64=('5e2c4b45b8537740b2240dcfdbc47cc494ef763fad64c3912846931585cf821f')
sha256sums_riscv64=('d5f66f6132f6014c42d7bbe82aebaff753b7f597f310e99e655e217ae1e128ca')
sha256sums_x86_64=('4c6e7c39ce962eba58be1909b6d8d85ebe4bb5cfac1d9bd3ddd68a560cde7223')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
