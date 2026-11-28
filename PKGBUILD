# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zakura-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Zcash full node"
arch=('x86_64' 'aarch64')
url="https://github.com/zakura-core/zakura"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zakura-core/zakura/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zakurad-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zakurad-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('f8f096ab5ee815515b5db3c5764754cb2efa38f19e9d93dfe509c09850b2ecc2')
sha256sums_x86_64=('7436aae1d8d9ca7e2e76141a98673e371ce8b4502544eef9151efa247e878bf8')
sha256sums_aarch64=('b77373aa3f81277ca3dcb327659dc04d9653c24031ea493bc56804357d605c1d')

package() {
  install -Dm755 "./bin/zakurad" "${pkgdir}/usr/bin/zakurad"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
