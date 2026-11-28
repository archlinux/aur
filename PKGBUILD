# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=awsping-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Check latency to each Amazon EC2 region"
arch=('x86_64')
url="https://github.com/ekalinin/awsping"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/awsping_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('4ae946447652467538985686b4613aee9284aaee8c1445fce33aae5a3c6dc06f')

package() {
  install -Dm755 "awsping" "${pkgdir}/usr/bin/awsping"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
