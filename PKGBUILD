# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=rink
pkgver=0.4.0
pkgrel=2
pkgdesc='Unit conversion tool and library written in rust'
arch=('x86_64')
url=https://github.com/tiffany352/rink-rs
license=('MPL2')
makedepends=('cargo')
source=("rink-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('78510545d58961f0df35be25bb47aaecac7e173dc7dcb8ceea29975a4ab6a4e1c8f7dfb91c8df5ef525bd23c530d6e0c6b671c3033f25ffc1984063991f89688')

build() {
  cd rink-rs-$pkgver
  cargo build --release
}

package() {
  cd rink-rs-$pkgver
  install -Dm644 LICENSE-MPL "$pkgdir"/usr/share/licenses/rink/LICENSE
  install -Dm755 target/release/rink "$pkgdir"/usr/bin/rink
}

# vim:set ts=2 sw=2 et:
