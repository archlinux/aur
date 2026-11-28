# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gogetcrawl-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Extract web archive data from the Wayback Machine and Common Crawl"
arch=('x86_64')
url="https://github.com/karust/gogetcrawl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/karust/gogetcrawl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/gogetcrawl-linux-amd64-${pkgver}.tgz")
sha256sums=('a3553ba80dda87948958650c6a92c9951839e1ec44f17ebde9e30bd2e52f328c')
sha256sums_x86_64=('2a63751652c3260bf0a533517110dd07ac44e28fa124a2ad5f2d6eb780745665')

package() {
  install -Dm755 "gogetcrawl" "${pkgdir}/usr/bin/gogetcrawl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
