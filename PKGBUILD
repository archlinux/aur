# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Matt McDonald <metzen@gmail.com>

pkgname=calcoo
pkgver=1.3.18
pkgrel=4
pkgdesc="RPN and algebraic scientific calculator"
url="http://calcoo.sourceforge.net"
license=("GPL")
depends=('cairo' 'gtk2')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/calcoo/$pkgname-$pkgver.tar.gz
	calcoo.png
	calcoo.desktop)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make LIBS='-lm'
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/calcoo.png" "$pkgdir/usr/share/pixmaps/calcoo.png"
  install -Dm644 "$srcdir/calcoo.desktop" "$pkgdir/usr/share/applications/calcoo.desktop"
}

md5sums=('0740045dc83fb74c7b40a785b37a6514'
         '11153b0b476e41f649b6a174bea7db6e'
         'd560d82dd5869120f6d544ac4d10cb9b')
