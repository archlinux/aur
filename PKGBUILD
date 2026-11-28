# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oxide-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Let PostgreSQL speak the MongoDB wire protocol"
arch=('x86_64')
url="https://github.com/fcoury/oxide"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fcoury/oxide/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/oxide_${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('83f5cc79be638ae8432ee3e1bdd356cf1822bd0ef51442c581d2311083314a05')

package() {
  install -Dm755 "oxide" "${pkgdir}/usr/bin/oxide"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
