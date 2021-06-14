# Maintainer: Zoe <chp321@gmail.com>
pkgname=wavsplit
pkgver=1.2.3
pkgrel=4
pkgdesc='Splits large WAV files at given time positions'
arch=('i686' 'x86_64')
url="https://download.tuxfamily.org/xcfaudio/WavSplit/"
license=('GPL2')
source=("https://download.tuxfamily.org/xcfaudio/WavSplit/${pkgname}-${pkgver}.tar.gz")
md5sums=('624ba5aa7d66bddb9003820014bf545b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Get rid of the pre-built binaries.
  rm -f wavsplit wavren
  ./configure --prefix=$pkgdir/usr
  make
}  
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -o root -g root -m0755 -d "$pkgdir/usr/bin"
  install -o root -g root -m0755 -d "$pkgdir/usr/share/man/man1"
  make BIN="$pkgdir/usr/bin" MAN="$pkgdir/usr/share/man/man1" install
}
