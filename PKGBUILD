# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gomockhandler-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Manage and check gomock mocks"
arch=('x86_64' 'aarch64')
url="https://github.com/sanposhiho/gomockhandler"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gomockhandler_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gomockhandler_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ce15f233fe75531e0c8bca24d2619e18f979837b84eeb8f353beb497f2fc2f86')
sha256sums_aarch64=('aa98523c3a9436b7b3009088215f8894ca9231715642a3c8012dbce8dfe21a60')

package() {
  install -Dm755 "gomockhandler" "${pkgdir}/usr/bin/gomockhandler"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
