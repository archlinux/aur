# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=truehdd-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Inspect and decode Dolby TrueHD bitstreams"
arch=('x86_64' 'aarch64')
url="https://github.com/truehdd/truehdd"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/truehdd-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/truehdd-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('284fb06bc74edf5211559873056f298b5e9b53851615fc3400f82107ae08870d')
sha256sums_aarch64=('9f0cab2b2d8c580f3458e49f9744bb829250128f57d185da748e8ff187fd79b5')

package() {
  install -Dm755 "./truehdd" "${pkgdir}/usr/bin/truehdd"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
