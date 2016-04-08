# Maintainer:  Tsipizidis Charalampos <tsipizic@gmail.com>
# Contributor: Evan Gates <evan.gates@gmail.com>
#              phloyd     <phloyd@iki.fi>
#			   Brandon Invergo <brandon@invergo.net>

pkgname=shtool
pkgver=2.0.8
pkgrel=2
pkgdesc="GNU shtool is a compilation of small but very stable and portable shell scripts into a single shell tool."
url="http://www.gnu.org/software/shtool/"
license=(GPL)
arch=(i686 x86_64)
depends=(perl)
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c5f7c6836882d48bc79049846a5f9c5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install || return 1
}
