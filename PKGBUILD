# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=threat-finder-bin
pkgver=0.4.2
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
sha256sums_x86_64=('20713bc89bb070b4c2b2f4b8032124df42922c9b14df842e9d031e95e51af759')
sha256sums_aarch64=('080922258f0883239c52bad9412a19bcddf7a19e8a7088a96e71ab92393f7736')

package() {
  install -Dm755 "threat-finder" "${pkgdir}/usr/bin/threat-finder"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
