# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reductstore-bin
pkgver=1.21.8
pkgrel=1
pkgdesc="Time-indexed object storage for robotics and industrial IoT"
arch=('x86_64' 'aarch64')
url="https://github.com/reductstore/reductstore"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/reductstore/reductstore/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/reductstore.x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/reductstore.aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('4c03ae895c83e5a3f2dabfa1a18a2a804ab9c96b54aa5a07753bc9371afa6ffb')
sha256sums_aarch64=('52ff1216c89015061b65646eaa25180eb0f36f68d44649eda464f9d1e84300c3')

package() {
  install -Dm755 "reductstore" "${pkgdir}/usr/bin/reductstore"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
