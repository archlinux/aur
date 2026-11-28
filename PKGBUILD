# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=danube-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="Distributed messaging broker platform"
arch=('x86_64')
url="https://github.com/danube-messaging/danube"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/danube-messaging/danube/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/danube-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('efb52e83752299171e2ce6e89e42f16c226ead6d4741c18cc471921e6fbe2adc')

package() {
  install -Dm755 "danube" "${pkgdir}/usr/bin/danube"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
