# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=c-graph
pkgver=2.0.1
pkgrel=1
pkgdesc="Demonstrates the theory of convolution underlying engineering systems and signal analysis. "
url="https://www.gnu.org/software/c-graph/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs')
source=("http://ftp.halifax.rwth-aachen.de/gnu/c-graph/$pkgname-$pkgver.tar.gz")
sha256sums=('2d267de3c9d75d8de95e5b51da11e7aa5e981291ee9a34ef6edcf8fea5084424')
# or any other gnu mirror

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make -k || true
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
