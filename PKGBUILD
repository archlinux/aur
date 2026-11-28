# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=beava-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Real-time decision features without streaming infrastructure"
arch=('x86_64' 'aarch64')
url="https://github.com/beava-dev/beava"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/beava-dev/beava/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/beava-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/beava-linux-arm64.tar.gz")
sha256sums=('d52174abcfe6e57b81accfa094cc2e02b59b9888d09a51f8a04a17237eb2e39c')
sha256sums_x86_64=('043ab762dd2b38b4218021b456d87425b0a21fdb3c82a4706015e35f5a78ba52')
sha256sums_aarch64=('51f88df09a098357fb86cb676d5b0bb33800b11caf53d1197ee77e30e80e29f2')

package() {
  install -Dm755 "beava" "${pkgdir}/usr/bin/beava"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
