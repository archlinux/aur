
# Contributor: Paolo Herms

pkgname=yices-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="An automatic theorem prover"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
#source=(http://yices.csl.sri.com/cgi-bin/yices2-newdownload.cgi?file=yices-$pkgver-$CARCH-pc-linux-gnu-static-gmp.tar.gz'&accept=I+Accept')
source=('http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-2.4.0-x86_64-unknown-linux-gnu-static-gmp.tar.gz&accept=I+Agree')
sha512sums=('a5d97673a55a39697b7bd930835df3db376f1cf0913dc9e503cf53b607738b7e86c573ced73dc8f598eceff15b1ac46d96782697c94990e39bf28d197986f0ab')

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
