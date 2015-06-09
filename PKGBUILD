
# Contributor: Paolo Herms

pkgname=yices-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="An automatic theorem prover"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
#source=(http://yices.csl.sri.com/cgi-bin/yices2-newdownload.cgi?file=yices-$pkgver-$CARCH-pc-linux-gnu-static-gmp.tar.gz'&accept=I+Accept')
source=('http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-2.3.1-x86_64-unknown-linux-gnu-static-gmp.tar.gz&accept=I+Agree')
case $CARCH in
    x86_64) md5sums=('43aa84f9afffc3ada7ce4a39534e7c01');;
    i686)   md5sums=('fa7dae18e59cc7259dd2c9159382afc9');;
esac

package() {
  cd "$srcdir/yices-$pkgver/"
  install -D bin/yices  "$pkgdir"/usr/bin/yices
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -D include/yices.h  "$pkgdir"/usr/include/yices.h
  install -D include/yices_exit_codes.h  "$pkgdir"/usr/include/yices_exit_codes.h
  install -D include/yices_limits.h  "$pkgdir"/usr/include/yices_limits.h
  install -D include/yices_types.h  "$pkgdir"/usr/include/yices_types.h
  install -m644 -D lib/libyices.so.2.3.1  "$pkgdir"/usr/lib/libyices.so.2.3.1
}
