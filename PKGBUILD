# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="ghfs"
_pkgname="go-http-file-server"
pkgname="${_pkgname}-bin"
pkgver=1.20.4
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
sha256sums=('9ee3f330145bbaa6d1a5f9e2baf8a853ef70e981ad79c96907b3eed3ef31c396')
sha256sums_aarch64=('ed5a05ce4a4e78d03aa6840226cb28f42b3cfbdd5cab75e4144f7c3bc875c3b4')
sha256sums_armv7h=('9b126c989cb452418fe6cc7c2e85a2d9c9f966703c3b71c21bf1f5e1bbb20bbd')
sha256sums_i686=('b7ba09cbf734511baab121acea1244a15ec5f630c1b15ffaf086725d254e19b5')
sha256sums_loong64=('b3ab9a0d3f935e473872ab19284b2f1b1365e628d0a0803785d1c5c97fe573f0')
sha256sums_riscv64=('031c6a389d94189e9a2a2e78a31a604995cf7d227761df43115cfb7f8e5a3229')
sha256sums_x86_64=('1af7bb8d53b0c43b6710a8d50563ec44ec6329881cebdda7a4bc30a6e256595f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
