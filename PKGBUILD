# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=opari2
pkgver=2.0.7
pkgrel=1
pkgdesc="Instrumentation tool for OpenMP and hybrid codes."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('gcc-fortran')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/$pkgname/tags/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e302a4cc265eb2a4aa27c16a90eabd9e1e58cb02a191dd1c4d86f9a0df128715')

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
