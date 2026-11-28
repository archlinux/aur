# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nigiri-bin
pkgver=0.5.17
pkgrel=1
pkgdesc="Docker box for Bitcoin and Liquid development"
arch=('x86_64' 'aarch64')
url="https://github.com/vulpemventures/nigiri"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vulpemventures/nigiri/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/nigiri-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/nigiri-linux-arm64")
sha256sums=('c32e87778a97bd094a21d3ff3a0ecd7be95ab33637bdaa3ada6ffa46fe8e37cd')
sha256sums_x86_64=('bad1d8c9fed25dc0843e70f4da167f25284ee869b1693c105352f5284255bc63')
sha256sums_aarch64=('be17a9dc724ed8edc5e835695bbf1c3075068565b9da500e048d27f6fb835f6b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nigiri"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
