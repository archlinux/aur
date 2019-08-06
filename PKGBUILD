# Maintainer: Jakob Dübel <jkbd@posteo.de>
pkgname=drc
pkgver=3.2.3
pkgrel=2
pkgdesc="Digital Room Correction FIR filter generator"
arch=('x86_64' 'i686' 'armv6' 'armv7h')
url="http://drc-fir.sourceforge.net/"
license=('GPL2')
depends=('gcc-libs')
optdepends=('octave: building graphs')

source=("https://sourceforge.net/projects/drc-fir/files/drc-fir/$pkgver/$pkgname-$pkgver.tar.gz")
	
sha1sums=('a23b43088c66ce9076ace16bac795e7bfa6c022b')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make
}

package() {
  install -dm644 "$pkgdir/usr/bin"

  cd "$srcdir/$pkgname-$pkgver/source"
  make DESTDIR="$pkgdir/" install
}
