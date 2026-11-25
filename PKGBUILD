# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vize-bin
pkgver=0.797.0
pkgrel=1
pkgdesc="Fast Vue.js toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/ubugeeei-prod/vize"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ubugeeei-prod/vize/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vize-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/vize-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('4e599bb8d73f48717952dab7ac683101cb21cb0584ab7bb3b851d80be82d726f')
sha256sums_x86_64=('99e12786cf6ece8fe71589756406f39a67cdf02529c9ee418142be9fe89e5190')
sha256sums_aarch64=('5be0a58945fff84c2f9ddee2dc88a71cec2ace04dea2315b816afc38dc2ca99d')

package() {
  install -Dm755 "vize" "${pkgdir}/usr/bin/vize"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
