# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=rickyd
pkgver=0.2.0
pkgrel=1
pkgdesc="An easily moddable clone of Rick Dangerous"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rickyd/"
license=("GPL3")
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-src-$pkgver.tar.gz)
md5sums=('3775f51ad19c81602d8c211c838ee69a')

build() {
  cd $srcdir/$pkgname-src-$pkgver
  ./bootstrap.sh
  make distclean
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-src-$pkgver
  make DESTDIR=$pkgdir install
}
