# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=log4j-sniffer-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="Scan archives for vulnerable log4j versions"
arch=('x86_64' 'aarch64')
url="https://github.com/palantir/log4j-sniffer"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/palantir/log4j-sniffer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/log4j-sniffer-${pkgver}-linux-amd64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/log4j-sniffer-${pkgver}-linux-arm64.tgz")
sha256sums=('8e6a8acf6633d0d7b746d458b5fa94df14c71906abfdfd9485c606483946a636')
sha256sums_x86_64=('db5b82310cb9a3d2ea44034050df944ba1a054b1b481b8575368eaf13dc7b454')
sha256sums_aarch64=('c23a8cb4485ebe7e07e82a9fed7db9b906244d7c907fbfc9e20296098915f0cb')

package() {
  install -Dm755 "log4j-sniffer" "${pkgdir}/usr/bin/log4j-sniffer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
