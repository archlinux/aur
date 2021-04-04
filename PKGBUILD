# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=libsrsirc
pkgver=0.0.14
pkgrel=1
pkgdesc="A lightweight IRC library (includes icat)"
arch=('i686' 'x86_64')
url="https://github.com/fstd/libsrsirc"
license=('BSD')
depends=(glibc)
options=(!libtool)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fstd/libsrsirc/raw/tar/libsrsirc-$pkgver.tar.gz?raw=true")
sha256sums=('7bf73c7b3ccbd73bcc423874abb49b0c59494f6a961640eebaf79a81c94e2dc7')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 et:
