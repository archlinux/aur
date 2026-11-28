# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gapic-showcase-bin
pkgver=0.45.0
pkgrel=1
pkgdesc="Demo API showcasing Google generated API client features"
arch=('x86_64')
url="https://github.com/googleapis/gapic-showcase"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/googleapis/gapic-showcase/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gapic-showcase-${pkgver}-linux-amd64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('d269ddfe0f6662fad5a5cef446e1932b40f686f93cc487baaff789446b8b9af8')

package() {
  install -Dm755 "gapic-showcase" "${pkgdir}/usr/bin/gapic-showcase"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
