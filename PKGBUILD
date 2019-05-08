# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=viu
pkgver=0.2.1
pkgrel=1
pkgdesc='A command-line application to view images from the terminal written in Rust'
arch=('x86_64')
url='https://github.com/atanunq/viu'
license=('MIT')
depends=()
conflicts=('viu-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9a07ff4121999c7b74a6fcb66a19121248f6e01e3446b8aac37e3f58b44e6850')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
