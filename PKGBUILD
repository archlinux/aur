# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.33
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('81a3ba93c8682e0c61f92d0b9f88ffb9f7298e8327bbd019538af2c594257ab0')

build() {
  cd "$pkgname-$pkgver"

  make "$pkgname"{,.1} cvssync.1
  2to3 -w cvssync cvsconvert
}

package() {
  cd "$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
