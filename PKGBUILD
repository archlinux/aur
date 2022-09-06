# Maintainer: Alessio Biancalana <dottorblaster@gmail.com>
pkgname=pacnews
pkgver=2.2.0
pkgrel=1
pkgdesc="Read Arch Linux News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('rust')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('8e394c619d904f6145e756d6ad06bf8a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT "target/release/pacnews" "$pkgdir/usr/bin/pacnews"
}
