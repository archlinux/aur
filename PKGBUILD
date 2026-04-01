# Maintainer : David Rosenstrauch <darose@darose.net>
# Prev. Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-gnutella
pkgver=1.3.1
pkgrel=1
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
sha512sums=(
	'87891d1454fc363873be1b0dd9cac7eade0092293e00de0adb3c6c547abf233afe1ee07b6dac3e424ae9a0b9d5f7f313e67f794c3a1f6229501450c31c149232'
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
