
# Contributor: Paolo Herms
# Maintainer: Brent Carmer

pkgname=yices-bin
pkgver=2.4.2
pkgrel=1
provides=('yices')
conflicts=('yices')
pkgdesc="An automatic theorem prover - download release binary"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
source=("http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-$pkgver-$CARCH-unknown-linux-gnu-static-gmp.tar.gz&accept=I+Agree")
sha512sums=('d9bf0cc20091e165db59ac97923e93e5137e21e88414b006a7569ffd5c4351ed55cbebcc7670f6df509ef2eb1824ec5fd77ec0a7ba798aa31ffc1ea621242351')

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
