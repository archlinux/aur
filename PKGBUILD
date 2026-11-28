# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gohangout-bin
pkgver=1.12.3
pkgrel=1
pkgdesc="Logstash-like pipeline from Kafka to Elasticsearch and ClickHouse"
arch=('x86_64' 'aarch64')
url="https://github.com/childe/gohangout"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/childe/gohangout/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gohangout-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gohangout-linux-arm64")
sha256sums=('406bdf33d56739976f182cc27db27be57c8f1d635603f3f7aac9cd5a769189a6')
sha256sums_x86_64=('17c7cf734deb0dd42d02b6012e76719752b461f7b7c0f63802a144e5d2e757cf')
sha256sums_aarch64=('61fee4e51e0caa5ec94992f375737e84dfd60696c02a2b4bdcaf9e3ea8437932')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gohangout"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
