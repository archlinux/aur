# Contributor: Evan Gates    <evan.gates@gmail.com>
# Contributor: Dag  Odenhall <dag.odenhall@gmail.com>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: William Giokas <1007380@gmail.com>
pkgname=ii
pkgver=2.0
pkgrel=1
pkgdesc="A minimalist FIFO and filesystem-based IRC client"
license=('MIT')
arch=('i686' 'x86_64')
url=http://tools.suckless.org/ii
depends=('glibc')
source=("http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz")
md5sums=('14a03b30ea4a7259820882d483c5c727')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS="${CFLAGS}" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
