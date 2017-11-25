# Maintainer: kpcyrd <git@rxv.cc>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cargo-tree
pkgver=0.14.0
pkgrel=1
pkgdesc="Cargo subcommand that visualizes a crate's dependency graph in a tree-like format"
url="https://github.com/sfackler/cargo-tree"
depends=('cargo' 'curl' 'http-parser')
makedepends=('cmake')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sfackler/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9b6893a10acef2e54445fc4757794926131788ebd95211c1ecaa80d85c515917')
sha512sums=('49aa964e4ce6b435bca63a7e788f9cef1b5e1c4071884413817b13b3657bb9d41be6629842acb6639559cbe6ecd1104cb572522ab311effd9017f2afaa88f7b1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
