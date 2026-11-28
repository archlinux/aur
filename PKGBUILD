# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=certs-maker-bin
pkgver=3.8.3
pkgrel=1
pkgdesc="Generate self-signed TLS certificates or a local CA with signed certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/soulteary/certs-maker"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/certs-maker_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/certs-maker_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2f65a3b87f19709880cdd14d4e02981d2136b7705978ee911275c2b23fdbbc10')
sha256sums_aarch64=('169f5f144c78d2743b82fc812029921a5eea788ea74cc7d2bb412170504ee247')

package() {
  install -Dm755 "certs-maker" "${pkgdir}/usr/bin/certs-maker"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
