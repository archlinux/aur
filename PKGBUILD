# Maintainer: Alessio Biancalana <alessio@dottorblaster.it>
pkgname=pacnews
pkgver=2.5.0
pkgrel=1
pkgdesc="Read Arch Linux News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('rust' 'openssl')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('f4a8d23d2d7fbb26625377f0f9d100af04fc178b95c54f64dd0c78491f948c23')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT "target/release/pacnews" "$pkgdir/usr/bin/pacnews"
}
