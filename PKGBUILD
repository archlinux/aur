# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=termpair-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="View and control terminals from your browser with end-to-end encryption"
arch=('x86_64' 'aarch64')
url="https://github.com/cs01/termpair"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cs01/termpair/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/termpair-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/termpair-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5465d224581419d98095529e5aa924ff8c1c41b9f7b9d92f5ab8b4ca8bd1359c')
sha256sums_x86_64=('191f8a35d859271ebe5ab63aeedbf0d05218b7da2eb5461a085134112cca81a2')
sha256sums_aarch64=('2964344ca7d8af9bd2e1810a7d4a2b8c7c0b74fae88c68b418a5dc53532a2647')

package() {
  install -Dm755 "termpair" "${pkgdir}/usr/bin/termpair"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
