# Contributor: masutu <masutu dot arch at googlemail dot com>
# Maintainer: masutu <masutu dot arch at googlemail dot com>

pkgname=jackminimix
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple mixer for the Jack Audio Connection Kit with an OSC based control interface."
arch=('i686' 'x86_64')
url="http://www.aelius.com/njh/jackminimix"
license=('GPL')
depends=('jack' 'liblo')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('d52186f51b9672da1987f3626c9673d1')

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
}

# vim:set ts=2 sw=2 et:
