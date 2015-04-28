# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.31
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=(http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5858b21af3a949523acabaf52b9094c5d97713b529df8ecfea9ec1b344c3b5b6')

build() {
  cd ${pkgname}-${pkgver}

  make $pkgname{,.1} cvssync.1
  2to3 -w cvssync cvsconvert
}

package() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr DESTDIR="${pkgdir}" install
}
