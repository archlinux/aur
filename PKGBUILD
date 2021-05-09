# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=otf2
pkgver=2.3
pkgrel=1
pkgdesc="Scalable, memory efficient event trace data format and support library."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/$pkgname/tags/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('36957428d37c40d35b6b45208f050fb5cfe23c54e874189778a24b0e9219c7e3')

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
