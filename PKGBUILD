# Maintainer: Brett M. Gilio <mail@brettgilio.com>

pkgname=interviews
pkgver=19
pkgrel=1
pkgdesc="GUI for neuron"
arch=('i686' 'x86_64')
url="http://www.neuron.yale.edu"
license=('GPL')
depends=('libx11' 'neuron')
source=("https://neuron.yale.edu/ftp/neuron/versions/v7.5/iv-19.tar.gz")
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
md5sums=('13b3c76dae57051d7764de18dbd46f6a')
