# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=harness9-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Local-first AI agent"
arch=('x86_64' 'aarch64')
url="https://github.com/ZhangShenao/harness9"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ZhangShenao/harness9/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/harness9_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/harness9_${pkgver}_linux_arm64.tar.gz")
sha256sums=('5a1201bcde46cca602d94cfa8b8c8823269f2b97547d3d323b984b43a65b1940')
sha256sums_x86_64=('b20e6e31a38558c21ed8cb4fbd7e3130a5a06be92ba2535cdf41cff4354bfed8')
sha256sums_aarch64=('2d2a62e8475e89eb3be21cd35b011c347fc4f8624cec35a643a0d072fc667aaa')

package() {
  install -Dm755 "harness9" "${pkgdir}/usr/bin/harness9"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
