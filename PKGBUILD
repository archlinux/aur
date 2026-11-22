# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=limitdeck-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="A compact, privacy-safe terminal dashboard for AI coding subscription limits"
arch=('x86_64' 'aarch64')
url="https://github.com/rockythink/limitdeck"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/limitdeck-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/limitdeck-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6ad41129739e942bc4fe68ed7bb317d7a27726a2546f7a97499636d633052efa')
sha256sums_aarch64=('cdf52d5d1c82eee4571ee619f89c6af3f2dbe5c7f1ab3193969c1a2c1a4731e1')

package() {
  install -Dm755 "limitdeck" "${pkgdir}/usr/bin/limitdeck"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
