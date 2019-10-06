# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=viu
pkgver=0.2.2
pkgrel=1
pkgdesc='A command-line application to view images from the terminal written in Rust'
arch=('x86_64')
url='https://github.com/atanunq/viu'
license=('MIT')
depends=()
conflicts=('viu-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4c7a7c670e7256f4d4fd0b1ca221dfbd4da79d12036af2c8b4fd222fe7287b73')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
