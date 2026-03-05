# Maintainer: lludol <little dot corn3620 at fastmail dot com>

pkgname=perry
pkgver=0.2.97
pkgrel=1
pkgdesc="Compile TypeScript to native executables (source build)"
arch=('x86_64')
url="https://github.com/PerryTS/perry"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("https://github.com/PerryTS/perry/archive/v${pkgver}.tar.gz")
sha256sums=('d28749d1b766c1c75554992936cfac37d7522db13182e65d7133328b03e1f68e')

build() {
  cd "perry-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "perry-${pkgver}"
  install -Dm755 "target/release/perry" "$pkgdir/usr/bin/perry"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
