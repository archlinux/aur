pkgname=pretty-copy
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple utility for copying files with progress"
arch=('x86_64')
url="http://github.com/0x50f13/pcp"
license=('GPL-3.0')
depends=('glibc')
makedepends=('rust')
source=("https://github.com/0x50f13/pcp/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("ca8ca370ba6bead123259c85258410d745dfe716487a40b3fa1c24b72c3b4776")

build() {
  cd "$srcdir/pcp-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/pcp-$pkgver"
  install -D -m 777 target/release/pretty-copy $pkgdir/usr/bin/pcp
}
