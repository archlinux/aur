# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Uwe Kaiser <ukaiser@gmail.com>
pkgname=loki-lib
pkgver=0.1.7
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A C++ library of designs, containing flexible implementations of common design patterns and idioms."
url="http://loki-lib.sourceforge.net/"
license=('MIT')
source=(http://downloads.sourceforge.net/sourceforge/loki-lib/loki-$pkgver.tar.gz)
md5sums=('005d79581fbe888ceabd65d46c99c8b1')

build() {
  cd "$srcdir/loki-$pkgver"
  make
}

package() {
  cd "$srcdir/loki-$pkgver"
  make prefix="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  echo "See license in header files." >> "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

