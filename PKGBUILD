# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=iris-tui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Live supervisor for every active Claude Code session - status, tokens, estimated cost"
arch=('x86_64')
url="https://github.com/itzenata/iris-tui"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/itzenata/iris-tui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/iris-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('1e9777c449a1c6a43247af66d1919ac46336f848380a8cec1d8d73f21658d412')
sha256sums_x86_64=('025dc1518676aa72a791dc2d691272983f64b9fa7d4b3399f11de8d3969c3438')

package() {
  install -Dm755 "iris" "${pkgdir}/usr/bin/iris"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
