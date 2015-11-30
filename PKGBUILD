# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: David Campbell <davekong@archlinux.us>

pkgname=interviews
pkgver=19
pkgrel=1
pkgdesc="GUI for neuron"
arch=('i686' 'x86_64')
url="http://www.neuron.yale.edu"
license=('custom')
depends=('libx11')
source=("http://www.neuron.yale.edu/ftp/neuron/versions/v7.4/iv-$pkgver.tar.gz")
md5sums=('79fde976b2c89590fb78854aa2c04101')

build() {
  cd "$srcdir/iv-$pkgver"
  ./configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir/iv-$pkgver"
  install -Dm644 Copyright "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  make DESTDIR="$pkgdir/" install
}
