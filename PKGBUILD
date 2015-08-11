
# Contributor: Paolo Herms
# Maintainer: Brent Carmer

pkgname=yices-bin
pkgver=2.4.1
pkgrel=1
provides=('yices')
conflicts=('yices')
pkgdesc="An automatic theorem prover"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
source=("http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-$pkgver-$CARCH-unknown-linux-gnu-static-gmp.tar.gz&accept=I+Agree")
sha512sums=('12f025632415363f51dea9d7515bda99cdd1c4834774af88deb7f79c7f068c9f8d29ab238f336ee1ca6f6411ccc2138e877711fce47f097ba606537fd9e61732')

package() {
  cd "$srcdir/yices-$pkgver/"
  install -D bin/yices  "$pkgdir"/usr/bin/yices
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -D include/yices.h  "$pkgdir"/usr/include/yices.h
  install -D include/yices_exit_codes.h  "$pkgdir"/usr/include/yices_exit_codes.h
  install -D include/yices_limits.h  "$pkgdir"/usr/include/yices_limits.h
  install -D include/yices_types.h  "$pkgdir"/usr/include/yices_types.h
  install -m644 -D lib/libyices.so.$pkgver  "$pkgdir"/usr/lib/libyices.so.$pkgver
}
