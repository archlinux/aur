# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=opari2
pkgver=2.0.5
pkgrel=2
pkgdesc="Instrumentation tool for OpenMP and hybrid codes."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('gcc-fortran')
source=(http://www.vi-hps.org/cms/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('9034dd7596ac2176401090fd5ced45d0ab9a9404444ff767f093ccce68114ef5')

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
