# Maintainer: David Adler <david dot jo dot adler aet gmail dot com>
pkgname=jnoisemeter
pkgver=0.1.0
pkgrel=1
pkgdesc="measures noise levels to various standards"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/index.html#jnoisemeter"
license=('GPL')
depends=('jack' 'clxclient' 'clthreads')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2)
md5sums=('245160e5623c7f21cdd6f862ac07cd85')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  sed -i 's/\/usr\/local/\/usr/' Makefile 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
