# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: wahnby <wahnby@yahoo.fr>

pkgname=gnunet-gtk
pkgver=0.12.0
pkgrel=1
pkgdesc="A frontend for GNUnet"
arch=('x86_64')
url="https://gnunet.org"
license=('GPL')
depends=('gnunet' 'glade' 'adns')
source=(https://ftp.gnu.org/gnu/gnunet/$pkgname-$pkgver.tar.gz)
sha256sums=('cb99da11d68107f9709ee5be49cc574e9a03054767334767930ae6b0bd1a4421')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|CC -E|CC -O2 -E|g' configure
  ./configure --prefix=/usr --with-gnunet=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
