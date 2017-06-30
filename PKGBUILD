
# Contributor: Paolo Herms
# Maintainer: Brent Carmer

pkgname=yices-bin
pkgver=2.5.2
pkgrel=1
provides=('yices')
conflicts=('yices')
pkgdesc="An automatic theorem prover - download release binary"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
source=("http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-$pkgver-$CARCH-unknown-linux-gnu-static-gmp.tar.gz&accept=I+Agree")
sha512sums=('f30aec962de8586361149cd9c696cd24a8fbe4a30544a8350a041a1a5f05c5c1f431f7459ab2050c9da2f126396853d576ab17610220134cdd55c20c3d6390fc')

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
