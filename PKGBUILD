# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=libsrsirc
pkgver=0.0.1
pkgrel=1
pkgdesc="A lightweight IRC library (includes icat)"
arch=('i686' 'x86_64')
url="https://github.com/srsbsns/libsrsirc"
license=('BSD')
depends=(glibc)
options=(!libtool)
source=("$pkgname-$pkgver.tar.gz::https://github.com/srsbsns/libsrsirc/blob/tar/libsrsirc-0.0.1.tar.gz?raw=true")
sha256sums=('e7b50a7940626af815672108e940d21d355bffbb008a0b8f53c42810a2f2ae5a')

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
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
