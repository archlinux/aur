pkgname=emercoin
pkgver=0.3.7
pkgrel=2
pkgdesc="Emercoin is a digital currency and blockchain service platform"
arch=('i686' 'x86_64')    
url="http://emercoin.com/"
license=('GPL3')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver-linux.tar.gz")
md5sums=('15efd4cfa08a277140027ac2c979e9a1')
package() {
    cd "$pkgname-$pkgver-linux"
    mkdir -p $pkgdir/usr/bin
  if [ "${CARCH}" = "x86_64" ]; then
    install -D -m755 ./bin/64/emercoind $pkgdir/usr/bin/emercoind
    install -D -m755 ./bin/64/emercoin-qt $pkgdir/usr/bin/emercoin-qt
  else
    install -D -m755 ./bin/32/emercoind $pkgdir/usr/bin/emercoind
    install -D -m755 ./bin/32/emercoin-qt $pkgdir/usr/bin/emercoin-qt
  fi
}
