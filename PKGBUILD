# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=emane
pkgver=1.2.2
pkgrel=1
pkgdesc="Extendable Mobile Ad-hoc Network Emulator"
arch=('i686' 'x86_64')
url="http://cs.itd.nrl.navy.mil/work/emane/index.php"
license=('BSD')
options=(!libtool)
depends=(libxml2 libpcap pcre libutil-linux python-protobuf python-lxml)
optdepends=('python: Python bindings')
makedepends=(python protobuf)
source=("https://github.com/adjacentlink/emane/archive/v$pkgver.tar.gz")
md5sums=('771d48679336c1e8373527c934cbbf88')

build() {
  cd "$srcdir/emane-1.2.2"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/emane-1.2.2"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
