
# Contributor: Brent Carmer

pkgname=yices
pkgver=2.4.1
pkgrel=1
pkgdesc="An automatic theorem prover"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
conflicts=('yices-bin')
builddepends=(
  'gcc>=4.0.0'
  'gperf>=3.0.0'
  'gmp>=4.1.0'
  'make'
)
source=("http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-$pkgver-src.tar.gz&accept=I+Agree")
sha512sums=('0398535a4bf8940cf10ed78873fffa6f177e6e20fcdffd5efea7ab40775efba0577951e63c42df6a28f7dae41c2ac9d970fd80bd8c0fe3286af7427068cd92be')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  #cd "$srcdir/yices-$pkgver/"
  #install -D bin/yices  "$pkgdir"/usr/bin/yices
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  #install -D include/yices.h  "$pkgdir"/usr/include/yices.h
  #install -D include/yices_exit_codes.h  "$pkgdir"/usr/include/yices_exit_codes.h
  #install -D include/yices_limits.h  "$pkgdir"/usr/include/yices_limits.h
  #install -D include/yices_types.h  "$pkgdir"/usr/include/yices_types.h
  #install -m644 -D lib/libyices.so.$pkgver  "$pkgdir"/usr/lib/libyices.so.$pkgver
}
