# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=siteone-crawler-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Website crawler and analyzer for SEO, security, accessibility and performance"
arch=('x86_64' 'aarch64')
url="https://github.com/janreges/siteone-crawler"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/siteone-crawler-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/siteone-crawler-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('09278d958d4a087fa46093805cd33b085b96618001dd31d45c448ad724c9024e')
sha256sums_aarch64=('aa0bc9b2d7c7da5b871d2326d91183ef7c3107e005ef16dba69c78c5e406f83e')

package() {
  install -Dm755 "siteone-crawler/siteone-crawler" "${pkgdir}/usr/bin/siteone-crawler"
  install -Dm644 "siteone-crawler/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "siteone-crawler/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
