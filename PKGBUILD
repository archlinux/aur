# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.2
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/cvs-fast-export/"
license=('GPL2')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('17e4f6de95622eb0f4d2148a5d2ce8a32e143ed1d37b91f6988977916e13f6ce')

prepare() {
  cd ${pkgname}-${pkgver}

  2to3 -w cvssync
}

build() {
  cd ${pkgname}-${pkgver}

  make $pkgname{,.1} cvssync.1
}

package() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
