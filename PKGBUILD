# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxy-scraper-checker-bin
pkgver=4153
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
sha256sums_x86_64=('3970bd5472e19073d5a475fa1e371ca95231686e99449dfcd9aba3f3236e1db8')
sha256sums_aarch64=('cf6d235a46c0dde356e572e67e06b86be6074643eafd96df5fbf601dffeeba0a')

package() {
  install -Dm755 "proxy-scraper-checker" "${pkgdir}/usr/bin/proxy-scraper-checker"
  install -Dm644 "LICENSE-THIRD-PARTY" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
