# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mailcrab-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Email test server for development"
arch=('x86_64' 'aarch64')
url="https://github.com/tweedegolf/mailcrab"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tweedegolf/mailcrab/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mailcrab-linux-x86-64-gnu-v${pkgver}")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mailcrab-linux-arm64-gnu-v${pkgver}")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('e0429c28c89ec7920153dfc0828009c8a0d090834e6c1a47640ad22dd1dd8b26')
sha256sums_aarch64=('80186bbbfe821d3ac313864c40e1f1e9a6d685f49f7e150dba0d1909e7d3f491')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mailcrab"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
