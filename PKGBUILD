# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=dsrpdb
fullpkgname=dsr-pdb
pkgver=1.0.3
pkgrel=2
pkgdesc="Simple C++ PDB reader"
url="http://graphics.stanford.edu/~drussel"
depends=('boost')
arch=('i686' 'x86_64')
license=('LGPL')
source=(http://graphics.stanford.edu/~drussel/$fullpkgname.tgz
        size_t.patch)

build() {
  cd $srcdir/$fullpkgname-$pkgver
  patch -p1 < $srcdir/size_t.patch
  CXXFLAGS=-frounding-math ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$fullpkgname-$pkgver
  make DESTDIR=$pkgdir install
}

md5sums=('aba4dd6d7ba2fae1a612d70192bd0bbe' '49dfc4cb6034f72aa64b3ea69fdb41f2')
