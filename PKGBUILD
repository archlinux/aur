# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Julien <paci79@free.fr>

pkgname=paris-traceroute
pkgver=0.92
pkgrel=2
pkgdesc="Paris traceroute is a new version of the well-known network diagnosis and measurement tool"
arch=('i686' 'x86_64')
depends=('glibc')
license=('GPL')
source=("http://www.paris-traceroute.net/downloads/paris-traceroute-$pkgver-dev.tar.gz")
url="http://www.paris-traceroute.net"
sha512sums=('ecae447bb3f811f5668d2beb24fb0146e9267189e14c10b09fe930daad552e97dbcde7208be6020c83b3560b41395a866a87d4076e6ce6c5d574490a9e0d9128')

build() {
  cd $srcdir/paris-traceroute-current

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/paris-traceroute-current

  make prefix=$pkgdir/usr install
  install -Dm644 man/$pkgname.8 $pkgdir/usr/share/man/man8/$pkgname.8
  install -Dm644 doc/tupleroute.dia $pkgdir/usr/share/$pkgname/tupleroute.dia
}