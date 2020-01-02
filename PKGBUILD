# Maintainer : David Rosenstrauch <darose@darose.net>
# Prev. Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-gnutella
pkgver=1.1.15
pkgrel=2
pkgdesc="A Gnutella server/client"
arch=('i686' 'x86_64')
url="http://gtk-gnutella.sourceforge.net/"
license=('GPL')
makedepends=('pkg-config')
depends=('gtk2' 'glib2' 'desktop-file-utils')
source=(
	"http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"
	"28f9cb813016803026a0d86216bf6438e92635e8.diff"
)
md5sums=(
	'5d86de32939f620f31a516be6d6d6522'
	'eb84ec59f24017ee3998700403186413'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../28f9cb813016803026a0d86216bf6438e92635e8.diff
  ./build.sh --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_PREFIX="$pkgdir/"
}
