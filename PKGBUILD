# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.0
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/cvs-fast-export/"
license=('GPL2')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('e5eff5a153621d14e2edf1548b5c2a2de3a2c76f41c7940f9f1f8ecb4a736ae3')

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
