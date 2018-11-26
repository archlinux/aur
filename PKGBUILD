# Maintainer : David Rosenstrauch <darose@darose.net>
# Prev. Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-gnutella
pkgver=1.1.14
pkgrel=1
pkgdesc="A Gnutella server/client"
arch=('i686' 'x86_64')
url="http://gtk-gnutella.sourceforge.net/"
license=('GPL')
makedepends=('pkg-config')
depends=('gtk2' 'glib2' 'desktop-file-utils')
install="$pkgname.install"
source=(
	"http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"
	"statx.patch"
)
md5sums=(
	'75414544a8a7bacd5c75b207e235de73'
	'439c8fc20775eee946199aafccae56f7'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../statx.patch  
  ./build.sh --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_PREFIX="$pkgdir/"
}
