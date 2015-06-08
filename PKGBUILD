# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Francesco Piccinno <stack.box@gmail.com>

pkgname=arpalert
pkgver=2.0.11
pkgrel=2
pkgdesc="Monitor ARP changes in ethernet networks"
arch=('i686' 'x86_64')
url="http://www.arpalert.org/"
license=('GPL')
depends=('libpcap')
source=(http://www.arpalert.org/src/$pkgname-$pkgver.tar.gz)
sha256sums=('d3166f0de57729902d84a61626794494c4eac80ee58241d07c813809328e62cd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/ --exec-prefix=/usr \
              --includedir=/usr/include \
              --datarootdir=/usr/share
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
