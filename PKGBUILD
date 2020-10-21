# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=maple
_pkgver=0.21
pkgver=0.1.21
pkgrel=1
pkgdesc='vim-clap external filter gadget'
arch=('x86_64')
url=https://github.com/liuchengxu/vim-clap
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$_pkgver/vim-clap-v$_pkgver.tar.gz")
b2sums=('e8abdaf3e438341a38c594a8c9a0b11fbaf0b8b95f607aecf47b5c93aac8c535a78ccfe274ccd7776c9a4635e3fe0db617774ba78bce7191b91074e922d069e2')

build() {
  cd vim-clap-$_pkgver
  cargo build --release --locked
}

package() {
  cd vim-clap-$_pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
