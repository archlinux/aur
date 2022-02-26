# Maintainer : David Rosenstrauch <darose@darose.net>
# Prev. Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-gnutella
pkgver=1.2.2
pkgrel=1
pkgdesc="A Gnutella server/client"
arch=('i686' 'x86_64')
url="https://github.com/gtk-gnutella/gtk-gnutella"
license=('GPL')
makedepends=('pkg-config')
depends=('gtk2' 'glib2' 'desktop-file-utils')
source=(
	"https://github.com/gtk-gnutella/gtk-gnutella/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	'e52484a28849a4d3eb064638e5116f64bac2ab3f224ab90baed7f69ea400d11d'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./build.sh --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_PREFIX="$pkgdir/"
}
