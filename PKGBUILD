# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=promruval-bin
pkgver=3.13.0
pkgrel=1
pkgdesc="Validate Prometheus, Thanos, Mimir and Loki rules"
arch=('x86_64' 'aarch64')
url="https://github.com/FUSAKLA/promruval"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/promruval_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/promruval_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('34a0adabc5f40c4db7a14c300f8fea670ec77abc7e294eaed91f69ebf51ce203')
sha256sums_aarch64=('4de627005ca0be734093f9d0b33ca4a95c9952f8af5f387c0bce699c82dcfc25')

package() {
  install -Dm755 "promruval" "${pkgdir}/usr/bin/promruval"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
