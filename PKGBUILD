# Maintainer: Alessio Biancalana <dottorblaster@gmail.com>
pkgname=pacnews
pkgver=2.3.0
pkgrel=2
pkgdesc="Read Arch Linux News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('rust' 'openssl')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('77310b4abb16d3017489e5c1785dbf3f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT "target/release/pacnews" "$pkgdir/usr/bin/pacnews"
}
