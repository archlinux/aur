# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=query-json-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Fast, portable implementation of a jq-inspired language"
arch=('x86_64')
url="https://github.com/davesnx/query-json"
license=('BSD-3-Clause')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/davesnx/query-json/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/query-json-linux-x64.zip")
sha256sums=('6640986ac6f29f8e2df077c0f0cc50322444a1f9fa29e3c51d95f08a6eb5e9fb')
sha256sums_x86_64=('c19e6a31ca48445c04fa6a92ad4dda734ffb268c90fef2ba15bd197dd9df4b88')

package() {
  install -Dm755 "query-json" "${pkgdir}/usr/bin/query-json"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
