# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=libdsk
pkgver=1.3.5
pkgrel=1
pkgdesc="A library for accessing floppy drive and disc images files"
arch=('i686' 'x86_64')
url="http://www.seasip.demon.co.uk/Unix/LibDsk/"
license=('LGPL')
depends=()
source=(http://www.seasip.info/Unix/LibDsk/$pkgname-$pkgver.tar.gz)
md5sums=('d768c1694c2ed8d58a47b253bb920c1f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
