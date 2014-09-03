# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.15
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/cvs-fast-export/"
license=('GPL2')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('b9f295900390c3822fe8f9e57fac584be112220215b29f1ee73df1b37a760dc5')

build() {
  cd ${pkgname}-${pkgver}

  make $pkgname{,.1} cvssync.1
  2to3 -w cvssync
}

package() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
