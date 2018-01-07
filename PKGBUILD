# Maintainer: kpcyrd <git@rxv.cc>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cargo-tree
pkgver=0.16.0
pkgrel=1
pkgdesc="Cargo subcommand that visualizes a crate's dependency graph in a tree-like format"
url="https://github.com/sfackler/cargo-tree"
depends=('cargo' 'curl' 'http-parser')
makedepends=('cmake')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sfackler/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('448080b3a69dedeac95d579bf9c55fff36a2dd7bee381aea6a4c999a51c272ae')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
