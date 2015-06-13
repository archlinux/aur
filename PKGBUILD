# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=clockywock
pkgver=0.3.1a
pkgrel=1
pkgdesc="Analog clock, with alarm and color, for command line."
arch=('i686' 'x86_64')
url="http://soomka.com/"
license=('GPL2')
depends=('ncurses')
source=(http://soomka.com/$pkgname-$pkgver.tar.gz)
md5sums=('8423ff1b7056dd12ddcf00fb63d96b60')

build() {
  cd "$pkgname-$pkgver"
  #sed -i 's/timex/&2/g' clockywock.cpp  # name clash
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 clockywock "$pkgdir/usr/bin/clockywock"
  install -Dm644 clockywock.7 "$pkgdir/usr/share/man/man7/clockywock.7"
}

