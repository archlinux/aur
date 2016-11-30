# Maintainer: Bambang Catur Pamungkas <bambangcaturz@gmail.com>

pkgname=aspell-id
pkgver=1.2
pkgrel=1
pkgdesc="Indonesian dictionary for aspell"
arch=('i686' 'x86_64')
url="http://aspell.net/"
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/id/aspell5-id-$pkgver-0.tar.bz2")
md5sums=('9136385a6ce0ff0d113427ab3c974254')
sha256sums=('523912082848d891746dbb233f2ddb2cdbab6750dc76c38b3f6e000c9eb37308')

build() {
  cd "$srcdir/aspell5-id-$pkgver-0"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell5-id-$pkgver-0"
  make DESTDIR="$pkgdir" install

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
