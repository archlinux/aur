# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=haqq-bin
pkgver=1.9.6
pkgrel=1
pkgdesc="HAQQ blockchain node"
arch=('x86_64' 'aarch64')
url="https://github.com/haqq-network/haqq"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/haqq_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/haqq_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2c64d1591b8a22015d76aba6f5cf3f55344d907b71d997f2bbb57983a44d1110')
sha256sums_aarch64=('829b2ebea914a13b5d33998e1060e7ae1c17c4fa560f4032ef6d974edff3b683')

package() {
  install -Dm755 "bin/haqqd" "${pkgdir}/usr/bin/haqqd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
