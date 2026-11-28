# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=second-order-bin
pkgver=3.2
pkgrel=1
pkgdesc="Second-order subdomain takeover scanner"
arch=('x86_64')
url="https://github.com/mhmdiaa/second-order"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mhmdiaa/second-order/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/second-order-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c2a50488a0f728983131d0f42e365dd18948b091399aa0afeb6be29802eaf988')
sha256sums_x86_64=('bb7c5211f0c45ef6778daeec062218e8bf2a3838da08f8997fe4d536a8710057')

package() {
  install -Dm755 "second-order" "${pkgdir}/usr/bin/second-order"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
