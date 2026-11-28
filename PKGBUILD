# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=orloj-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Orchestration runtime for multi-agent AI systems"
arch=('x86_64' 'aarch64')
url="https://github.com/OrlojHQ/orloj"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/orlojd_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/orlojd_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9a169731aab73a1d064bf7b2cde5ac947ef643f67a1876bf016c982d34297c67')
sha256sums_aarch64=('94964fceafd7cd2955c86ba9c69858061cffde0946a44086cf152f07b8e34862')

package() {
  install -Dm755 "orlojd" "${pkgdir}/usr/bin/orlojd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
