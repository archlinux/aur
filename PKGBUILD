# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nvelox-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Event-driven TCP and UDP load balancer and proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/nvelox/nvelox"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nvelox_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nvelox_linux_arm64.tar.gz")
sha256sums_x86_64=('7d104d66fc9527dfa85965af2be1691026a822e5dc8ea78d411fe4cca1987daa')
sha256sums_aarch64=('6158ad68ef53b48c981f2dbfc9855392381adc6a35763ee2285db8f92d0326b0')

package() {
  install -Dm755 "nvelox" "${pkgdir}/usr/bin/nvelox"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
