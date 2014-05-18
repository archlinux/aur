# Maintainer: Julien Savard <juju2143@gmail.com>
pkgname=libmmd
pkgver=0.7.4.3
pkgrel=1
pkgdesc="A renderlib for mikumiku dance pmd model and vmd motion files"
url="http://frostworx.de/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('bullet' 'sfml')
makedepends=('make' 'cmake')
conflicts=()
replaces=()
backup=()
install=
source=(http://frostworx.de/files/$pkgname-$pkgver.tar.gz)
md5sums=('324b9b906f82ae08753105be13a684aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDEBUG=ON -DWANTBULLET=ON .
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
