# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=opari2
pkgver=2.0.6
pkgrel=1
pkgdesc="Instrumentation tool for OpenMP and hybrid codes."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('gcc-fortran')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/$pkgname/tags/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('55972289ce66080bb48622110c3189a36e88a12917635f049b37685b9d3bbcb0')

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
