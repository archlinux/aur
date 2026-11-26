# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dashbrr-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Dashboard for monitoring and managing media stack services"
arch=('x86_64' 'aarch64')
url="https://github.com/autobrr/dashbrr"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dashbrr_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dashbrr_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cee467fa76d75b56743def67e7b51bdb1d5b76e6f4aef66e4dabad223d73eae5')
sha256sums_aarch64=('807d0d18a93193f40bf1ed1cd69d4af63f3b72835ac1d26ab81bf140486d167e')

package() {
  install -Dm755 "dashbrr" "${pkgdir}/usr/bin/dashbrr"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
