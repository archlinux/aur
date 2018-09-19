# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_commit=0db3f4dcd0e7b661c720418bedd88f9e4e6e37b7
pkgname=rink
pkgver=0.4.3.r8.g0db3f4d
pkgrel=1
pkgdesc='Unit conversion tool and library written in rust'
arch=('x86_64')
url=https://github.com/tiffany352/rink-rs
license=('GPL3' 'MPL2')
depends=('gcc-libs' 'gmp' 'openssl')
makedepends=('rust')
source=("rink-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('719299bf3792e3c468679e6bfa910a31eef2ee0a1d78943109992773ab18f9b2e756b5f580c8200db18d9a5ec4872ab3a74a0788d442e526efb1c85a7d686227')

build() {
  cd rink-rs-$_commit
  cargo build --release
}

check() {
  cd rink-rs-$_commit
  cargo test --release
}

package() {
  cd rink-rs-$_commit
  install -Dm755 target/release/rink "$pkgdir"/usr/bin/rink
}

# vim:set ts=2 sw=2 et:
