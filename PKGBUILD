# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pensyve-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="Universal memory runtime for AI agents"
arch=('x86_64')
url="https://github.com/major7apps/pensyve"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/major7apps/pensyve/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pensyve-cli-linux-amd64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('e9c335625df15ccb34a0bad19ad2e71fa5600ae6f1fe92cfc2592853463a1b2f')

package() {
  install -Dm755 "pensyve" "${pkgdir}/usr/bin/pensyve"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
