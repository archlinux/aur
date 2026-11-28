# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxy-scraper-checker-bin
pkgver=4220
pkgrel=1
pkgdesc="Scrapes HTTP, SOCKS4 and SOCKS5 proxies from public sources and checks which ones work"
arch=('x86_64' 'aarch64')
url="https://github.com/monosans/proxy-scraper-checker"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_tag="build-${pkgver}"
_dl="${url}/releases/download/${_tag}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/proxy-scraper-checker-binary-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/proxy-scraper-checker-binary-aarch64-unknown-linux-gnu.zip")
sha256sums_x86_64=('b92deae9e9dc388a13dd36130ff65bbb1516e156a3f985db85a0e851404e438a')
sha256sums_aarch64=('1c09c692846b28ba20823316863981b68e1b21490fe31599a36164d8a64f500f')

package() {
  install -Dm755 "proxy-scraper-checker" "${pkgdir}/usr/bin/proxy-scraper-checker"
  install -Dm644 "LICENSE-THIRD-PARTY" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
