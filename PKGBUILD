# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openzeppelin-monitor-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Blockchain monitoring service with configurable notifications"
arch=('x86_64' 'aarch64')
url="https://github.com/OpenZeppelin/openzeppelin-monitor"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-monitor/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openzeppelin-monitor-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openzeppelin-monitor-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('4b907cedfca06eb724afd854bbdadf960e1bc3aeb61b856b18bb1b1f19ab7ee7')
sha256sums_aarch64=('cdad7e4401ab0bdfb78671ada5be82900fe0d8a98d179a84d4c0e7568d34283d')

package() {
  install -Dm755 "openzeppelin-monitor" "${pkgdir}/usr/bin/openzeppelin-monitor"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
