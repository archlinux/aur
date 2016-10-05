
# Contributor: Paolo Herms
# Maintainer: Brent Carmer

pkgname=yices-bin
pkgver=2.5.1
pkgrel=1
provides=('yices')
conflicts=('yices')
pkgdesc="An automatic theorem prover - download release binary"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
source=("http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-$pkgver-$CARCH-unknown-linux-gnu-static-gmp.tar.gz&accept=I+Agree")
sha512sums=('806c75ba85e06cc761d2d19bb0ce2a6727d6a3240a53b0fb4f3e2f3bf17c176def551166a39b75fc423451647454922492ebb8dddac27b76155c90ce1c53cd96')

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
