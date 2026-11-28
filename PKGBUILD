# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ibtop-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Real-time terminal monitor for InfiniBand networks"
arch=('x86_64' 'aarch64')
url="https://github.com/JannikSt/ibtop"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/JannikSt/ibtop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ibtop-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ibtop-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('8bd22c26b9983782752d75bdfb3a16ee0eeef318f8b7e89a0221465358c6a7f9')
sha256sums_aarch64=('ea3145702129a28f82dc0642e51675cfe77f2a13ed3f16d547d4bda0a518a1bb')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ibtop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
