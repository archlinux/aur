# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deceptifeed-bin
pkgver=0.69.0
pkgrel=1
pkgdesc="Honeypot servers with an integrated threat feed"
arch=('x86_64' 'aarch64')
url="https://github.com/r-smith/deceptifeed"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/r-smith/deceptifeed/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/deceptifeed_${pkgver}_linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/deceptifeed_${pkgver}_linux_ARM64.tar.gz")
sha256sums=('56b0a39da2f45f9db6713737ed461a3b36225240ee51bac2bd9cb1d0fc510364')
sha256sums_x86_64=('0c0c4be9ca06a238601fad4b0efa77dc4a6c27f84a499fd23b6c6b637c3b3529')
sha256sums_aarch64=('f0e506469ace19af18c4c3506236c94672d3daef482d616b31b0b5ac2f7e9db3')

package() {
  install -Dm755 "deceptifeed/deceptifeed" "${pkgdir}/usr/bin/deceptifeed"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
