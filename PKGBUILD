# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: David Campbell <davekong@archlinux.us>

pkgname=interviews
pkgver=18
pkgrel=1
pkgdesc="GUI for neuron"
arch=('i686' 'x86_64')
url="http://www.neuron.yale.edu"
license=('custom')
depends=('libx11')
source=("http://www.neuron.yale.edu/ftp/neuron/versions/v7.3/iv-$pkgver.tar.gz")
options=('')
md5sums=('faf5782b5bbe63f2f0049b212f429f50')

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
