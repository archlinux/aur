# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=cargo-tree
pkgver=0.7.0
pkgrel=1
pkgdesc="A cargo subcommand that visualizes a crate's dependency graph in a tree-like format"
url='https://github.com/skackler/cargo-tree'
depends=('curl' 'http-parser')
makedepends=('cargo' 'cmake')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sfackler/cargo-tree/archive/v$pkgver.tar.gz")
md5sums=('121e989dcd2b6829943252541ce9c3b6')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
