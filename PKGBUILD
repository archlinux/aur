# Contributor: masutu <masutu dot arch at googlemail dot com>
# Maintainer: masutu <masutu dot arch at googlemail dot com>

pkgname=louderbox
pkgver=0.1.0
pkgrel=3
pkgdesc="A complete 8 band audio processor using the jack audio connection kit."
arch=('i686' 'x86_64')
url="http://nixbit.com/cat/multimedia/audio/louderbox/"
license=('GPL')
depends=('jack' 'libglade' 'swh-plugins' 'tap-plugins')
source=(http://www.sourcefiles.org/Multimedia/Mixers/$pkgname-$pkgver.tar.gz)
md5sums=('d3e0eeeff6282e703c1da38cd696e830')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS="-ldl" ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 README $pkgdir/usr/share/${pkgname}/README
  install -m644 AUTHORS $pkgdir/usr/share/${pkgname}/AUTHORS
}

# vim:set ts=2 sw=2 et:

