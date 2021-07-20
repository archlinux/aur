# Maintainer: Raymundo Cassani <raymundo.cassani@gmail.com>
# Contributor: Vladimir Cerny <blackvladimir@gmail.com>
pkgname=xoscope
pkgver=2.3
pkgrel=1
pkgdesc="A digital oscilloscope using input from a sound card. This package does not support COMEDI devices."
arch=("i686" "x86_64")
url="http://xoscope.sourceforge.net/"
license=('GPL')
depends=('fftw' 'gtkdatabox' 'alsa-lib')
install=
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
 
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('737504856797fb0eac6f9c768446a184')
