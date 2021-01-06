# Maintainer: Lukas Šupienis <youremail@domain.com>

pkgname=aspell-lt
pkgver=1.3.2
pkgrel=1
pkgdesc="Lithuanian dictionary for aspell"
arch=('any')
url="https://github.com/ispell-lt/ispell-lt"
license=('BSD')
depends=("aspell")
source=("https://github.com/ispell-lt/ispell-lt/releases/download/rel-$pkgver/aspell6-lt-$pkgver.tar.bz2")
md5sums=('8a0a47605206944461025360e1a2a607')
sha256sums=('70032e2ac2829b58af76fd5fb245b661d54c9391137904250e945774bae0a55f')

build() {
  cd "$srcdir/aspell6-lt-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-lt-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m644 Copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
