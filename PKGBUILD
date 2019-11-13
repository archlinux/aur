# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=emane
pkgver=1.2.5
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
md5sums=('41a25a22fbc248edeab50a5abf732f31')

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
