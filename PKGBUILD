# Maintainer: Frank Tao <boku@kaneki.dev>
pkgname=vega
pkgver=2.1.0
pkgrel=1
pkgdesc="A way faster command line system information tool"
arch=('x86_64')
url="https://github.com/fubuki4649/vega"
license=('GPL3')
depends=('pciutils')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/vega "$pkgdir/usr/bin/vega"
}
