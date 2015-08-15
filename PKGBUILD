# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=gnusim8085
pkgver=1.3.7
pkgrel=1
pkgdesc="graphical simulator, assembler and debugger for the Intel 8085 microprocessor"
arch=('i686' 'x86_64')
url="http://gnusim8085.org/"
license=('GPL')
depends=('gtk2' 'gtksourceview2')
source=("http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('6baabf2d32685a3447a6c1382589ea84')
install=$pkgname.install

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
