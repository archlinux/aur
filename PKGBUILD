# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=virtualsmartcard
pkgver=0.6
pkgrel=1
pkgdesc="Virtual Smart Card emulates a smart card and makes it accessible through PC/SC"
url="http://sourceforge.net/projects/vsmartcard/"
arch=('i686' 'x86_64')
license=( "GPLv3" )
depends=( "pcsclite" )
makedepends=( "help2man" )
source=( "http://downloads.sourceforge.net/project/vsmartcard/$pkgname/$pkgname-$pkgver.tar.gz" )
sha1sums=('ca8916354089443fb141ae8e6644c1b42a964c71')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
