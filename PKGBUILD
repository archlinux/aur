pkgname=('xmille')
pkgver=2.0
pkgrel=1
pkgdesc='A X11 mille borne game'
license=('unknown')
source=('Xmille.tar.gz::http://sourceforge.net/projects/xmille/files/Xmille.tar.gz/download'
        'patch.diff')
md5sums=('ed1c73d02cf99af353833fea7a433d30'
         'f325d30a07542f384514059255543b38')
arch=('i686' 'x86_64')
depends=('libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext')
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
