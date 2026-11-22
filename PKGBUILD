# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-reviewr-bin
pkgver=0.52.2
pkgrel=1
pkgdesc="A code-review pane for coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/persiyanov/herdr-reviewr"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/persiyanov/herdr-reviewr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/herdr-reviewr-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/herdr-reviewr-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('73bc3217b4609e0c94e0e30089976b9607f49c96462f44f8e74f58a67abc658a')
sha256sums_x86_64=('6b5d868b3a3de6130b97dc767f7a56255782c69259d3204fb56828090991c2d3')
sha256sums_aarch64=('d1f9f51dec1736883b166c2973b8bdd3b8ad64dca20cf681d6f0c79c889e4944')

package() {
  install -Dm755 "herdr-reviewr" "${pkgdir}/usr/bin/herdr-reviewr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
