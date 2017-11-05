
# Contributor: Paolo Herms
# Maintainer: Brent Carmer

pkgname=yices-bin
pkgver=2.5.4
pkgrel=1
provides=('yices')
conflicts=('yices')
pkgdesc="An automatic theorem prover - download release binary"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
source=("http://yices.csl.sri.com/releases/2.5.4/yices-2.5.4-x86_64-pc-linux-gnu-static-gmp.tar.gz")
sha512sums=('be17ce09f24ee7ff4e8d795d8ff9916a1d6c4506331ad184908e85485a92f3ef1890bd9c95126dbccd07e39e5c02318980815497725afe2692358859ec68cdd1')

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
