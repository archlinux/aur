# Contributor: masutu <masutu dot arch at googlemail dot com>
# Maintainer: masutu <masutu dot arch at googlemail dot com>

pkgname=jackmeter
pkgver=0.4
pkgrel=1
pkgdesc="A basic console based DPM (Digital Peak Meter) for JACK."
arch=('i686' 'x86_64')
url=('http://www.aelius.com/njh/jackmeter')
license=('GPL')
depends=('jack')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('f8915a1dd8ba448c3b9d62b30d107a22')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share
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
