# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chproxy-bin
pkgver=1.30.0
pkgrel=1
pkgdesc="ClickHouse HTTP proxy and load balancer"
arch=('x86_64' 'aarch64')
url="https://github.com/ContentSquare/chproxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chproxy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chproxy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a5d814e11020d09a943e3082faa7a972f7ddd94564ad9402deec1e6417224e65')
sha256sums_aarch64=('16e9400ce097c5b5b87618a5ed95cb5da9b4ae3226643a8f7ea80c80b94fe942')

package() {
  install -Dm755 "chproxy" "${pkgdir}/usr/bin/chproxy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
