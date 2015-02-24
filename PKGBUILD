pkgname=superiotool-svn
pkgver=6637
pkgrel=1
pkgdesc="Detects the Super I/O of your mainboard and provides information about its register contents"
arch=(i686 x86_64)
url="http://www.coreboot.org/Superiotool"
license=(GPL)
makedepends=(subversion)
source=(svn://coreboot.org/coreboot/trunk/util/superiotool)
md5sums=(SKIP)

pkgver() {
  cd "$SRCDEST/superiotool"
  svnversion
}

build() {
  cd "$srcdir/superiotool"
  make
}

package() {
  cd "$srcdir/superiotool"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

