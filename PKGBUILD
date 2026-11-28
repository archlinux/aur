# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=daptin-bin
pkgver=0.13.68
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
sha256sums_x86_64=('81c9e0b8217a979d03086eb6a6a77b35f1b39d1cfd3d16d5362ecce3c5973496')
sha256sums_aarch64=('d332c8a9e7dfef9b73a7ce53513fef522dc448a2ae7f8f670271c9e4a598eb6e')

package() {
  install -Dm755 "./daptin" "${pkgdir}/usr/bin/daptin"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
