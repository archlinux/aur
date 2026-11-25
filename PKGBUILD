# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxy-scraper-checker-bin
pkgver=4183
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
sha256sums_x86_64=('85d704bd4ae2284e751466c972b47c5486a23f90c5e1ae6784ac62f59f7f5864')
sha256sums_aarch64=('8332738433049d45253f46f65a6f4a45a16c763d878af9e6a03bb367dd6224a5')

package() {
  install -Dm755 "proxy-scraper-checker" "${pkgdir}/usr/bin/proxy-scraper-checker"
  install -Dm644 "LICENSE-THIRD-PARTY" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
