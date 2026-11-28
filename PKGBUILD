# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=amazon-ec2-spot-interrupter-bin
pkgver=0.0.16
pkgrel=1
pkgdesc="Trigger Amazon EC2 Spot interruption notifications and rebalance recommendations"
arch=('x86_64' 'aarch64')
url="https://github.com/aws/amazon-ec2-spot-interrupter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ec2-spot-interrupter_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ec2-spot-interrupter_linux_arm64.tar.gz")
sha256sums_x86_64=('7a504350e186d4803899c2dfd3cb0a25cd2bd2ec48cacfee3b6791c76bbc6e1d')
sha256sums_aarch64=('542fed49faf445bce7b5a40822f7ecdf6ee38faf8af9e37767b4831e124595d0')

package() {
  install -Dm755 "ec2-spot-interrupter" "${pkgdir}/usr/bin/ec2-spot-interrupter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
