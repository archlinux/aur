# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rushdb-bin
pkgver=3.0.15
pkgrel=1
pkgdesc="Graph, vector and analytics database for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/rush-db/rushdb"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rushdb-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rushdb-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5120ba0842237ff7a08cd41e8e74b4ee2b3b9605b39cb2a4e2f79a363dfafc55')
sha256sums_aarch64=('6bc41f32f454829622b2a22591a58b0e7f47a4b55e9e9268457ad51b95fdfbf8')

package() {
  install -Dm755 "rushdb" "${pkgdir}/usr/bin/rushdb"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
