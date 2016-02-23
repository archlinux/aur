# Author: Yann Pomarede

pkgname=jconvolver
pkgver=0.9.2
pkgrel=1
pkgdesc="Jconvolver is a Convolution Engine for JACK, examples installed in /etc/jconvolver"
arch=('any')
url="http://kokkinizita.linuxaudio.org/linuxaudio"
license=(GPL)
depends=('zita-convolver' 'clthreads' 'jack')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2)
md5sums=('f1a33f0f455961a7b21b56bdb0f725b1')

build() { 
  cd "$srcdir/$pkgname-$pkgver/source"
  make PREFIX=/usr 
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/jconvolver"
  cp -a "$srcdir/$pkgname-$pkgver/config-files" "$pkgdir/usr/share/jconvolver/examples"
}
