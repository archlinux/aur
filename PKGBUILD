# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pingclair-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Web server and reverse proxy built on Cloudflare Pingora"
arch=('x86_64' 'aarch64')
url="https://github.com/dorianverlaine/pingclair"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dorianverlaine/pingclair/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pingclair-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pingclair-linux-aarch64.tar.gz")
sha256sums=('6c00b3d23697b9e7c39b962979bc769dd4b90a1bae52f0b67f487b2c561f1c13')
sha256sums_x86_64=('3f0d76ee9f1a2e34a6cd32c6e8220df5511c1915b1ec6b27d2af2b4097894c5e')
sha256sums_aarch64=('e1a57acc36e279e7af31f741e89533a12a193c7ba26dd5cd5dde1527fe56a34c')

package() {
  install -Dm755 "pingclair" "${pkgdir}/usr/bin/pingclair"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
