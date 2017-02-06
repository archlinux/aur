# Maintainer: Samadi van Koten

pkgname=minifb
pkgver=r25.a5e8dd4
pkgrel=1
pkgdesc='A small, cross platform library to create a frame buffer that you can draw pixels in'
arch=('i686' 'x86_64')
url='https://github.com/emoon/minifb'
license=('MIT')
depends=(libx11)
makedepends=(git)
source=("$pkgname::git+https://github.com/emoon/minifb" 'minifb.mk')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make -f "$srcdir/minifb.mk"
}

package() {
  cd "$srcdir/$pkgname"
  make -f "$srcdir/minifb.mk" DESTDIR="$pkgdir/" install
}


