# Maintainer: masutu subric <masutu dot arch at googlemail dot com>
# Contributor: masutu subric <masutu dot arch at googlemail dot com>
pkgname=aseqview
pkgver=0.2.8
pkgrel=1
pkgdesc="An ALSA sequencer user-client which works as event viewer."
arch=('i686' 'x86_64')
url="http://www.alsa-project.org/~tiwai/alsa.html"
license=('GPL')
depends=('alsa-lib' 'gtk')
source=("ftp://ftp.suse.com/pub/people/tiwai/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('5f75e1b6fc5eab6b40ae2c7a74216a7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr/ || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 ChangeLog $pkgdir/usr/share/doc/${pkgname}/ChangeLog
  install -D -m644 AUTHORS $pkgdir/usr/share/doc/${pkgname}/AUTHORS
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname}/README
}

# vim:set ts=2 sw=2 et:
