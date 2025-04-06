# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi(Canmi21)

pkgname=openjlc
pkgver=2.21.7
pkgrel=2
pkgdesc="Ultra-fast Gerber conversion tool written in Rust."
arch=('x86_64')
url="https://github.com/canmi21/openjlc"
license=('MIT')
depends=('glibc' 'zstd')
makedepends=('cargo' 'zstd')

source=("git+https://github.com/canmi21/openjlc.git#branch=main" 
        "https://raw.githubusercontent.com/canmi21/openjlc/main/LICENSE")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  mv openjlc openjlc-$pkgver
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/openjlc "$pkgdir/usr/bin/openjlc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
