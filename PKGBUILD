# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gately-bin
pkgver=0.6.8.8
pkgrel=1
pkgdesc="Self-hosted gateway with reverse proxy, automatic HTTPS, DDNS, NAT traversal and WAF"
arch=('x86_64' 'aarch64')
url="https://github.com/wangwanjie/gately"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gately_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gately_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('781217c8ae267096ed3c04d721718a2df183084bbb5dd9420ca3d87be4ee17c8')
sha256sums_aarch64=('958559ba3c4b6006a0eb1a3afdd1b70ca7dbd2b05fb280acff2f1fe705ae8c91')

package() {
  install -Dm755 "gately" "${pkgdir}/usr/bin/gately"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
