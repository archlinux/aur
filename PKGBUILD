# Maintainer: Amr Hassan <amr.hassan@gmail.com>
pkgname=weave
pkgver=0.1.1
pkgdesc="Extensions for status bars"
url="https://github.com/amrhassan/weave"
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')
source=("https://github.com/amrhassan/weave/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/weave-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$srcdir/weave-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
md5sums=('2537c1b99e6eaa6bf94702a17850952b')
