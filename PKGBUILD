# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opencode-stats-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="A terminal dashboard for OpenCode usage statistics and cost breakdowns"
arch=('x86_64')
url="https://github.com/Cateds/opencode-stats"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Cateds/opencode-stats/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/oc-stats-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('08a2f13038865b865ae8ff29c4afa7ff4222e5ff220945fd6d3d066595aa2095')
sha256sums_x86_64=('52d2f3c65ead7e6deb942cdc8ad422ceb9f024f7f324022035c52efcd015311b')

package() {
  install -Dm755 "oc-stats" "${pkgdir}/usr/bin/oc-stats"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
