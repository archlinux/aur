# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boxen-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Package network operating systems into containers"
arch=('x86_64' 'aarch64')
url="https://github.com/carlmontanari/boxen"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/boxen_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/boxen_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3abe708b6acb0c5dd49f68b223a24fbaddb6efbeb2693f8ea40f84266f74b4c9')
sha256sums_aarch64=('7f846907c06ae5592b56c3d6f84142ae1f2038315291277ffaa387d223cff942')

package() {
  install -Dm755 "boxen" "${pkgdir}/usr/bin/boxen"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
