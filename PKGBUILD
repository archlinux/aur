# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=opari2
pkgver=2.0.2
pkgrel=1
pkgdesc="Instrumentation tool for OpenMP and hybrid codes."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('gcc-fortran')
source=(http://www.vi-hps.org/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('067df2a90db8e417ea043563dbf7dc92396deb7c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
