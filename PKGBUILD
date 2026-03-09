# Maintainer: lludol <little dot corn3620 at fastmail dot com>

pkgname=perry
pkgver=0.2.173
pkgrel=1
pkgdesc="Compile TypeScript to native executables (source build)"
arch=('x86_64')
url="https://github.com/PerryTS/perry"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("https://github.com/PerryTS/perry/archive/v${pkgver}.tar.gz")
sha256sums=('a5b7065dda15d5bea14a03e9f3db76d09a9834bf7aa1d0c6303535dec4bc6826')

build() {
  cd "perry-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "perry-${pkgver}"
  install -Dm755 "target/release/perry" "$pkgdir/usr/bin/perry"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
