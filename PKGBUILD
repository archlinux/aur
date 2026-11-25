# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goldilocks-bin
pkgver=4.16.5
pkgrel=1
pkgdesc="Get your resource requests 'Just Right'"
arch=('x86_64' 'aarch64')
url="https://github.com/FairwindsOps/goldilocks"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goldilocks_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goldilocks_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2e57b7c5cbfaa1e913ae016542debe56e0e6193825366c068c1704727d80fff2')
sha256sums_aarch64=('3a617065316374836306c162ae194ff8f928caf31b0f8008d23585be92dd8293')

package() {
  install -Dm755 "goldilocks" "${pkgdir}/usr/bin/goldilocks"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
