# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=daptin-bin
pkgver=0.13.65
pkgrel=1
pkgdesc="Self-hosted application server for schema-driven APIs, identity, files, automation, integrations, realtime, metering, and protocols"
arch=('x86_64' 'aarch64')
url="https://github.com/daptin/daptin"
license=('LGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/daptin-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/daptin-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('9f019f9d13cc1f71b239f3c22a8c2144f7244f9b9ef3923c0f5cd631f06c2914')
sha256sums_aarch64=('8c400fb2dea8082bf4cc07a10528ab7f2000f0d7e91ce055192825f4c59f647c')

package() {
  install -Dm755 "./daptin" "${pkgdir}/usr/bin/daptin"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
