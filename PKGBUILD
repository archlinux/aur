# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxy-scraper-checker-bin
pkgver=4171
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
sha256sums_x86_64=('0666fd8a4a86a2016b433c11729e55f7c6fd47f40b41df5b9c5a50325bbce3d5')
sha256sums_aarch64=('f15e59f149f07de09ef2d19c4f701133790311a0ea6f745d582073bbd796aac4')

package() {
  install -Dm755 "proxy-scraper-checker" "${pkgdir}/usr/bin/proxy-scraper-checker"
  install -Dm644 "LICENSE-THIRD-PARTY" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
