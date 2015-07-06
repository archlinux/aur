# Contributor: masutu <masutu dot arch at googlemail dot com>
# Maintainer: masutu <masutu dot arch at googlemail dot com>

pkgname=jackminimix
pkgver=0.2
pkgrel=1
pkgdesc="A simple mixer for the Jack Audio Connection Kit with an OSC based control interface."
arch=('i686' 'x86_64')
url="http://www.aelius.com/njh/jackminimix"
license=('GPL')
depends=('jack' 'liblo')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('28d7d137f2db50f325459924c78a18c2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 AUTHORS $pkgdir/usr/share/${pkgname}/AUTHORS
  install -m644 README  $pkgdir/usr/share/${pkgname}/README
  install -m644 TODO  $pkgdir/usr/share/${pkgname}/TODO
}

# vim:set ts=2 sw=2 et:
