# Maintainer : David Rosenstrauch <darose@darose.net>
# Prev. Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-gnutella
pkgver=1.1.5
pkgrel=1
pkgdesc="A Gnutella server/client"
arch=('i686' 'x86_64')
url="http://gtk-gnutella.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'desktop-file-utils')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('09ad223a1e2087e5ba36c63becd18a4a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./build.sh --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_PREFIX="$pkgdir/"
}
