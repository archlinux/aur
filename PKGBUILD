# Maintainer: Alessio Biancalana <alessio@dottorblaster.it>
pkgname=pacnews
pkgver=2.4.3
pkgrel=1
pkgdesc="Read Arch Linux News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('rust' 'openssl')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('60d874a012147a89932cdba4c92fb2716789623dae05ce30212f0747fd810295')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -DT "target/release/pacnews" "$pkgdir/usr/bin/pacnews"
}
