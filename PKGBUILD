# Maintainer: Suryansh Deshwal <suryanshdeshwal@gmail.com>
# Maintainer: Ambar Chakravartty <amch9605@gmail.com>
pkgname=VX6
pkgver=1.0.0
pkgrel=1
pkgdesc="A decentralized IPv6-native self-hosting fabric that eliminates the need for tunnels, relays, and centralized infrastructure."
arch=('x86_64')
url="https://github.com/ethical-buddy/VX6"
license=('Apache-2.0')
depends=('systemd')
makedepends=('go')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ethical-buddy/VX6/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('SKIP')

build() {
  cd "$srcdir/VX6-$pkgver"
  make build
}
package() {
  cd "$srcdir/VX6-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

