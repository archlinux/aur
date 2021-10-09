# Maintainer: Alessio Biancalana <dottorblaster@gmail.com>
pkgname=pacnews
pkgver=2.1.2
pkgrel=1
pkgdesc="Read Arch Linux News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('rust')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('e2b8383d95f0d93c169d060c12a7786c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT "target/release/pacnews" "$pkgdir/usr/bin/pacnews"
}
