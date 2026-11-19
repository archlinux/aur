# Maintainer: Nick G. <wirlaburla@worlio.com>

pkgname=amiwm
pkgver=0.22pl2
pkgrel=1
pkgdesc="An X window manager that tries to mimic the Amiga Workbench screen."
arch=('i686' 'x86_64')
url="http://www.lysator.liu.se/~marcus/amiwm.html"
license=('amiwm')
depends=('xorg-xinit')
source=("ftp://hina.lysator.liu.se/pub/X11/wm/$pkgname/$pkgname$pkgver.tar.gz" "destdir.patch")
sha256sums=('7156412dc3efd1e7afc08c7f8d975d3cdfcdcecf1d90d49a360fe386390c5b74'  'e5fef99985f8ff955ddee52428d1d6e9da15043389fcafb25200b7dbf199206b')

build() {
  cd $pkgname$pkgver
  patch -p1 -i ../destdir.patch
  ./configure --prefix=/usr CFLAGS="-std=gnu89"
  make
}

package() {
  cd $pkgname$pkgver
  make DESTDIR="$pkgdir/" install
}
