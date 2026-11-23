# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxy-scraper-checker-bin
pkgver=4163
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
sha256sums_x86_64=('814a4bd0f87ff6c81974d1960d2400f3d6e20d8bd043ee8f30b084f628d4ba5b')
sha256sums_aarch64=('cde50a97d2bf60caac65458cba92f0421029384f28ee77c729a82ab0101d9914')

package() {
  install -Dm755 "proxy-scraper-checker" "${pkgdir}/usr/bin/proxy-scraper-checker"
  install -Dm644 "LICENSE-THIRD-PARTY" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
