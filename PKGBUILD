# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=throttle
pkgver=1.2
pkgrel=1
pkgdesc="Copies the standard input to the standard output while limiting bandwidth to the specified maximum."
arch=('i686')
url="http://klicman.org/throttle/"
license=('GPL')
depends=('glibc')
source=(http://klicman.org/$pkgname/$pkgname-$pkgver.tar.gz)

md5sums=('bb8abf5a9a63ed7d80951f056543a88c')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
