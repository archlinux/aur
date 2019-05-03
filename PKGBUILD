# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=viu
pkgver=0.1.0
_pkgver=0.1
pkgrel=1
pkgdesc='A command-line application to view images from the terminal written in Rust'
arch=('x86_64')
url='https://github.com/atanunq/viu'
license=('MIT')
depends=()
conflicts=('viu-git')
makedepends=('rust' 'cargo')
source=("$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('91257246ce8f7a9512e87afe994d8e34982c1c8555fcf40f04f17bf13b05aca4')

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$_pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
