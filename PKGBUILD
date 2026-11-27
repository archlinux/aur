# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=whycodes-bin
pkgver=0.6.39
pkgrel=1
pkgdesc="A fast, provider-independent AI coding agent for the terminal that works with hosted APIs"
arch=('x86_64')
url="https://github.com/whycorporation/whycodes"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/whycodes-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e9e628117a3484249d1293466693bef0fb8791f39a85ef29ba13c1b12590140d')

package() {
  install -Dm755 "whycodes" "${pkgdir}/usr/bin/whycodes"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
