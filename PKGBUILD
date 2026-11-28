# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crabby-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Web page performance tester with Prometheus, InfluxDB, Graphite and Datadog output"
arch=('x86_64' 'aarch64')
url="https://github.com/chrissnell/crabby"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/chrissnell/crabby/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/crabby_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/crabby_${pkgver}_linux_arm64.tar.gz")
sha256sums=('6635a2b856794ad2cb336201c73cff954bba8f1ae6b2cee06423960a8a39b790')
sha256sums_x86_64=('cf4a40098fbb2c0b02be2c0eb82ea3cb7a1b23c94880df333e0b1ab6475dcf15')
sha256sums_aarch64=('01099cac9e299e327031cf4e31decc47eb9735ed73fc5be5fa5a2adb1850395c')

package() {
  install -Dm755 "crabby" "${pkgdir}/usr/bin/crabby"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
