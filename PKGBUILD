# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kminion-bin
pkgver=2.6.1
pkgrel=1
pkgdesc="Prometheus exporter for Apache Kafka"
arch=('x86_64' 'aarch64')
url="https://github.com/redpanda-data/kminion"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kminion_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kminion_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d2deb4149453274ebac41e0995b2a26530303f8ab9d8fb7bc5f078cddf2d7bab')
sha256sums_aarch64=('43e2b4b8dd2b3bab24a9ed94f986286c91d86468658cd64509fd95bb6e7c5c71')

package() {
  install -Dm755 "kminion" "${pkgdir}/usr/bin/kminion"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
