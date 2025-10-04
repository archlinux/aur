# Maintainer : David Rosenstrauch <darose@darose.net>
# Prev. Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-gnutella
pkgver=1.2.3
pkgrel=2
pkgdesc="A Gnutella server/client"
arch=('i686' 'x86_64')
options=('!lto')
url="https://github.com/gtk-gnutella/gtk-gnutella"
license=('GPL')
makedepends=('pkg-config')
depends=('gtk2' 'glib2' 'desktop-file-utils')
source=(
	"https://github.com/gtk-gnutella/gtk-gnutella/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	'1ce25bd5949b6c7b0e6069bc2481d398c464bc20cc0fae91ac3cc12cc62d15bf'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CFLAGS="${CFLAGS} -std=gnu17"
  ./build.sh --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_PREFIX="$pkgdir/"
}
