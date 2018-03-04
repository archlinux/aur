pkgname=('xmille')
pkgver=2.0
pkgrel=3
pkgdesc='A X11 mille borne game'
license=('unknown')
source=('Xmille::git+https://git.code.sf.net/p/xmille/code#commit=2e0e7ef1dfd71004209210d0f2da6ea5c2c130a0'
        'patch.diff')
md5sums=(SKIP
         'f325d30a07542f384514059255543b38')
arch=('x86_64')
depends=('libxext')
makedepends=('libxext')

package() {
  cd "$srcdir/Xmille"
  make install DESTDIR="$pkgdir/usr"
  make install.man DESTDIR="$pkgdir/usr/share"
}

prepare() {
  cd "$srcdir/Xmille"
  patch <../../patch.diff
}

build() {
  cd "$srcdir/Xmille"
  make clean
  make
}
