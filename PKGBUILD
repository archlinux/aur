# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
pkgname=vc-dwim
pkgver=1.8
pkgrel=1
pkgdesc="GNU utilities for version control and maintaining changelog files"
arch=('any')
url="https://www.gnu.org/software/vc-dwim/"
license=('GPL')
depends=('perl')
source=(ftp://ftp.gnu.org/gnu/vc-dwim/vc-dwim-${pkgver}.tar.xz{,.sig})
sha256sums=('61a4f30aade459043630f09a1aaa9a445255bb2c234b8e2a3a8802c29cc2ba34'
            'SKIP')
validpgpkeys=('155D3FC500C834486D1EEA677FD9FCCB000BEEEE')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
