# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=socks5lb-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="SOCKS5 proxy load balancer and transparent proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/mingcheng/socks5lb"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/socks5lb_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/socks5lb_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('edc7ae7d60adf2bf2b3b71e86ac5f337533ed29921d73489d2595745ae491d7c')
sha256sums_aarch64=('d959e30be55f854cb3d368fc01f2c8a3c5aa0cb353bfa040db4fafe5191b0de6')

package() {
  install -Dm755 "socks5lb" "${pkgdir}/usr/bin/socks5lb"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
