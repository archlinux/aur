# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=chkrootkit
pkgver=0.50
pkgrel=2
pkgdesc="rootkit detector"
arch=(i686 x86_64)
url="http://www.chkrootkit.org/"
license=('GPL2')
source=("ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.tar.gz")
sha256sums=('9548fc922b0cb8ddf055faff4a4887f140a31c45f2f5e3aa64aad91ecfa56cc7')
depends=('net-tools')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  for f in check_wtmpx chkdirs chklastlog chkproc chkrootkit chkutmp chkwtmp ifpromisc; do
    install -Dm755 "$srcdir/$pkgname-$pkgver/$f" "$pkgdir/usr/bin/$f"
  done
}
