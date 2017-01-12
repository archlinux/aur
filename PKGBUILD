# Maintainer: Vladimir Cerny <blackvladimir@gmail.com>
pkgname=xoscope
pkgver=2.2
pkgrel=1
pkgdesc="A digital oscilloscope using input from a sound card. This package does not support COMEDI devices."
arch=("i686" "x86_64")
url="http://xoscope.sourceforge.net/"
license=('GPL')
depends=('fftw' 'gtkdatabox' 'alsa-lib')
install=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
 
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('468ff79d38b5645f9033b564091bfecd')
