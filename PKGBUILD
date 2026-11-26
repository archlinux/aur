# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sqlvet-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Static analysis of raw SQL queries in Go code"
arch=('x86_64')
url="https://github.com/houqp/sqlvet"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/houqp/sqlvet/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sqlvet-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('7eb6872f62b20c2441c3ee9fd30f916da6fa4b8da5f4619c029e0cc542e1e0b9')
sha256sums_x86_64=('158b76811d619034b394e779776ac2a1525031b8e0c163996f0976207b923aa7')

package() {
  install -Dm755 "sqlvet" "${pkgdir}/usr/bin/sqlvet"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
