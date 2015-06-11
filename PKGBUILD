# Maintainer: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: Johan PONIN <johan.ponin.pro at gmail dot com>
pkgname=tiptop
pkgver=2.2
pkgrel=1
pkgdesc="Tiptop: Hardware Performance Counters for the Masses"
arch=('i686' 'x86_64')
url="http://tiptop.gforge.inria.fr/"
license=('GPL')
groups=()
depends=('libxml2' 'ncurses' 'zlib' 'xz')
makedepends=()
optdepends=()
provides=($pkgname)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
url="http://tiptop.gforge.inria.fr/releases/"
source=($url$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(74255a29acf44569db021b080ad3e3f7) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
