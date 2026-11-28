# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=txtx-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Infrastructure-as-code runbooks for web3"
arch=('x86_64')
url="https://github.com/solana-foundation/txtx"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/solana-foundation/txtx/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/txtx-linux-x64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('a3b54564e7291e2398c8766d22d9c38768cdf2db508ad38d84f46bfe19490d28')

package() {
  install -Dm755 "txtx" "${pkgdir}/usr/bin/txtx"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
