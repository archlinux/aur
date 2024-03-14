# Maintainer: Alessio Biancalana <dottorblaster@gmail.com>
pkgname=pacnews
pkgver=2.4.0
pkgrel=1
pkgdesc="Read Arch Linux News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('rust' 'openssl')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('971141fff40bf1c84499446260c91da7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT "target/release/pacnews" "$pkgdir/usr/bin/pacnews"
}
