# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jesin <jesin00@gmail.com>
# Contributor: Gabriele Lanaro <gabriele.lanaro@gmail.com>

pkgname=f2c
pkgver=1.0
pkgrel=8
pkgdesc='Fortran to C code translator'
url='http://www.netlib.org/f2c/index.html'
license=('custom')
arch=('x86_64' 'i686')
source=("git://github.com/juanjosegarciaripoll/f2c.git#commit=90cda47429")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
} 

# vim:set ts=2 sw=2 et:
