# Maintainer: Alessio Biancalana <alessio@dottorblaster.it>
pkgname=pacnews
pkgver=2.5.1
pkgrel=1
pkgdesc="Read Arch Linux News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('rust' 'openssl')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('d481a80aed987461ee489a33fcd9b0948f4796acb7a3de3041dea1c84d2ab5bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT "target/release/pacnews" "$pkgdir/usr/bin/pacnews"
}
