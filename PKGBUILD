# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=doc-scraper-bin
pkgver=2.29.0
pkgrel=1
pkgdesc="Scrape documentation sites into clean Markdown for LLM ingestion"
arch=('x86_64' 'aarch64')
url="https://github.com/Sriram-PR/doc-scraper"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/doc-scraper_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/doc-scraper_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('75a2785c5d3d28de11e9ad6c6ad027c422545d1ad8957c432ea012dd3ae67f41')
sha256sums_aarch64=('77df94417bdc7af27cafa3b4eb77394f89f87ccfc112515dd72adcb7d7fef943')

package() {
  install -Dm755 "doc-scraper" "${pkgdir}/usr/bin/doc-scraper"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
