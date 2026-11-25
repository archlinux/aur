# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=threat-finder-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Find CVEs in services running on a host"
arch=('x86_64' 'aarch64')
url="https://github.com/offseq/threat-finder"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/threat-finder-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/threat-finder-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('576fe956edf3dd115b6098824497b31c819e0b395c35296bb836fb04de81e79d')
sha256sums_aarch64=('0792a3e6bd0171e7a32359b617904d4cc3a3f81797a6ffd5b264c0856e2a93ab')

package() {
  install -Dm755 "threat-finder" "${pkgdir}/usr/bin/threat-finder"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
