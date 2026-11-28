# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=duragraph-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Self-hosted AI workflow orchestration with event sourcing"
arch=('x86_64' 'aarch64')
url="https://github.com/Duragraph/duragraph"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/duragraph_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/duragraph_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9b8f9877919658bf7f8e40080ad5d75c4fa403331d3aa09a3cd96c51c891d973')
sha256sums_aarch64=('54ba403580fc4d2e8be38d79be97ad4850c938eef9eee1d1e6ad433fd7b3bed3')

package() {
  install -Dm755 "duragraph" "${pkgdir}/usr/bin/duragraph"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
