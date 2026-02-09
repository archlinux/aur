pkgname=ethtui
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI for Ethernet status (Omarchy-style)"
arch=('x86_64')
url="https://github.com/skibidiandulka/ethtui"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d03f91fbe04701f2ecb4a9b2a9c88e22dc3c51d411bde20ae0bc7af3d4ac9e5')

build() {
  cd "${srcdir}/ethtui-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/ethtui-${pkgver}"

  install -Dm755 "target/release/ethtui" "${pkgdir}/usr/bin/ethtui"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

