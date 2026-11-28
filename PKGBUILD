# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=httpgenerator-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Generate .http files from OpenAPI specifications"
arch=('x86_64')
url="https://github.com/christianhelle/httpgenerator"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/christianhelle/httpgenerator/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/httpgenerator-${pkgver}-linux-x64.tar.gz")
sha256sums=('da1ca04cae4a2dc97d8cff1738e2ce3d4576bb9799cf7e997d833273e926c200')
sha256sums_x86_64=('acba46604a14d66a7c623d0d4c3a91bcf342312120021545074519d26d5dfeea')

package() {
  install -Dm755 "httpgenerator" "${pkgdir}/usr/bin/httpgenerator"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
