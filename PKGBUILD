# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=otf2
pkgver=2.1.1
pkgrel=1
pkgdesc="Scalable, memory efficient event trace data format and support library."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
source=(https://www.vi-hps.org/cms/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('ab2a67cad55cf27dde27adeabc2ae01fc2b8ac14')

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
