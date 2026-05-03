# Maintainer: Suryansh Deshwal <suryanshdeshwal@gmail.com>
# Maintainer: Ambar Chakravartty <amch9605@gmail.com>
pkgname=vx6
pkgver=1.1.0
pkgrel=1
pkgdesc="A decentralized IPv6-native self-hosting fabric that eliminates the need for tunnels, relays, and centralized infrastructure."
arch=('x86_64')
url="https://github.com/ethical-buddy/vx6"
license=('Apache-2.0')
depends=('systemd')
makedepends=('go')
source=(
  "$pkgname-v$pkgver.tar.gz::https://github.com/ethical-buddy/vx6/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  make build
}
package() {
  cd "$srcdir/${pkgname}-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

