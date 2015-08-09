# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Hong-Yi Dai <reflectionalist_at_gmail_dot_com>

pkgname=picosat
pkgver=960
pkgrel=1
pkgdesc="The PicoSAT solver"
arch=('i686' 'x86_64')
url="http://fmv.jku.at/picosat/"
license=('MIT')
source=("http://fmv.jku.at/picosat/${pkgname}-${pkgver}.tar.gz")
md5sums=('bee515cd9fd12ffaffab10b3587aa833')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 picosat "$pkgdir/usr/bin/picosat"
  install -Dm755 picomus "$pkgdir/usr/bin/picomus"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

