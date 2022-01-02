# Maintainer: Tom Wambold <tom5760@gmail.com>
# Contributor: Markus Sommer <markus@splork.de>
pkgname=emane
pkgver=1.3.3
pkgrel=1
pkgdesc="Extendable Mobile Ad-hoc Network Emulator"
arch=('i686' 'x86_64')
url="https://github.com/adjacentlink/emane"
license=('BSD')
options=(!libtool)
depends=(libxml2 libpcap pcre libutil-linux python-protobuf python-lxml)
optdepends=('python: Python bindings')
makedepends=(python protobuf)
source=("https://github.com/adjacentlink/emane/archive/v$pkgver.tar.gz")
sha512sums=('c8fa1d19de41bb3362ad2db2560b92ecd96f6590edaf007ee1ad49ad0fe376e0419a8d0c05a310991cfba0c1d28ca5a877c197e4f430cbea8d2f302e72542e18')

build() {
  cd "$srcdir/emane-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/emane-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
