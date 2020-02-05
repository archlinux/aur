# Maintainer Adrian Tymorek <adrian.tymorek@protonmil.com>

pkgname=interviews
pkgver=19
pkgrel=1
pkgdesc="GUI for neuron"
arch=('i686' 'x86_64')
url="http://www.neuron.yale.edu"
license=('GPL')
depends=('libx11' 'neuron')
source=("https://neuron.yale.edu/ftp/neuron/versions/v7.7/iv-19.tar.gz")
md5sums=('4ffb44b21c67f1126128953f349e24e4')

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

