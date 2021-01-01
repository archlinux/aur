# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=maple
_pkgver=0.22
pkgver=0.1.22
pkgrel=1
pkgdesc='vim-clap external filter gadget'
arch=('x86_64')
url=https://github.com/liuchengxu/vim-clap
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$_pkgver/vim-clap-v$_pkgver.tar.gz")
b2sums=('6fe672853936f556f456e9d0852cd4886b9d81a694c8b2e823097561a9fb8588b5811409c28ef002c96d3a4db2404a1543431868c5dc7a7a47fe60d7cdeb3311')

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
