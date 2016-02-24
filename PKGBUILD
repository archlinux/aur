# Maintainer: Lukas Šupienis <youremail@domain.com>

pkgname=aspell-lt
pkgver=1.3
pkgrel=1
pkgdesc="Lithuanian dictionary for aspell"
arch=('any')
url="https://launchpad.net/ispell-lt"
license=('BSD')
depends=("aspell")
source=("https://launchpad.net/ispell-lt/main/1.3/+download/aspell6-lt-$pkgver.tar.bz2")
md5sums=('89937691e10cadc5104b87a1a3a1451f')
sha256sums=('6bedad114f544e65dc677ddc6eb1f9f448d3774a6e39ce4c24984dc22193f451')

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
