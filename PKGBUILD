# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vize-bin
pkgver=0.812.0
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
sha256sums_x86_64=('204962138a5d50e89b396574f68b79d06f7e489ab15a442ab7c62221ef989e83')
sha256sums_aarch64=('7092ef83bf778a7eb047a86a23b6a85b5dd3a8254a2095843465ebc07bee8344')

package() {
  install -Dm755 "vize" "${pkgdir}/usr/bin/vize"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
