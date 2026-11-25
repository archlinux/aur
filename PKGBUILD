# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=monitoror-bin
pkgver=4.0.1
pkgrel=1
pkgdesc="Unified monitoring wallboard Light, ergonomic and reliable monitoring for anything"
arch=('x86_64')
url="https://github.com/monitoror/monitoror"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/monitoror/monitoror/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/monitoror-linux-amd64-${pkgver}")
sha256sums=('00c9be539851cc87e5eeb2b8bb1abd488e3e8a755dd1002837cb85e9fb42e4ae')
sha256sums_x86_64=('e13ec2ad1c7d0bcad2e6e04193ad14b0f648cc91d8103f1a55d9b1424789f9bd')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/monitoror"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
