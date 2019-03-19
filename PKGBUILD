# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.47
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("https://gitlab.com/esr/cvs-fast-export/-/archive/$pkgver/cvs-fast-export-$pkgver.tar.gz")
sha512sums=('8a3a420cdac100485a416acdfc019a654a5e7b792b803d8036f0cd00aa49751a53dd10d3a5b590049275c3d43044f56b954c9efff742fc663a17fb5161a2dd86')

build() {
  cd "$pkgname-$pkgver"

  make "$pkgname"{,.1} cvssync.1
}

package() {
  cd "$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
