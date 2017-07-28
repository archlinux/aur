# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=rink
pkgver=0.4.1
pkgrel=1
pkgdesc='Unit conversion tool and library written in rust'
arch=('x86_64')
url=https://github.com/tiffany352/rink-rs
license=('Custom:MPLv2' 'GPL3')
makedepends=('cargo')
source=("rink-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fa35afd1ea25a0bb3d2963281205f61fb585dd03f60c74771dca8958583389c48d1919c411c8232a8d1da1d6ed06fed9543f200796a682066875d38c69a63218')

build() {
  cd rink-rs-$pkgver
  cargo build --release
}

check() {
  cd rink-rs-$pkgver
  cargo test --lib --tests
}

package() {
  cd rink-rs-$pkgver
  install -Dm644 LICENSE-MPL "$pkgdir"/usr/share/licenses/rink/LICENSE
  install -Dm755 target/release/rink "$pkgdir"/usr/bin/rink
}

# vim:set ts=2 sw=2 et:
