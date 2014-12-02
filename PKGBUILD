# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=scrub
pkgver=2.6.1
pkgrel=1
pkgdesc="Iteratively writes patterns on files or disk devices to make retreiving the data more difficult"
arch=('i686' 'x86_64')
url="http://code.google.com/p/diskscrub/"
license=('GPL')
source=(https://github.com/chaos/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('838b061b2e1932b342fb9695c5579cdff5d2d72506cb41d6d8032eba18aed969')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
