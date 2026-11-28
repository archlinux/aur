# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gossiphs-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="Zero-setup code file relationship analysis"
arch=('x86_64')
url="https://github.com/williamfzc/gossiphs"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/williamfzc/gossiphs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gossiphs-linux-x86_64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('4d1a14c89edf18dd379e8d2d3750b93202c286fb2b97ab9acfcdea528fe28fa8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gossiphs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
