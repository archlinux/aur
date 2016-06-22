# Contributor: Oliver Graute <oliver.graute@gmail.com>
pkgname=dnstop
pkgver=20140915 # note: if the pkgver had been '0.99-10' then use an underscore. like '0.99_10'
pkgrel=1
pkgdesc="displays various tables of DNS traffic on your network"
arch=(i686 x86_64)
url="http://dns.measurement-factory.com/tools/dnstop"
license=('BSD')
groups=('')
provides=('')
depends=('libpcap')
makedepends=('')
conflicts=('')
replaces=('')
backup=('')
install=''
source=(http://dns.measurement-factory.com/tools/dnstop/src/$pkgname-$pkgver.tar.gz)
md5sums=('f0fe1690b114e076196a51d63266eadc')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
	  cd $srcdir/$pkgname-$pkgver
	  #make DESTDIR=$pkgdir install
	  #make PREFIX=$pkgdir install
	mkdir -p $pkgdir/usr/bin/
	cp "$srcdir/$pkgname-$pkgver/dnstop" "$pkgdir/usr/bin/dnstop"
	chmod +x $pkgdir/usr/bin/dnstop
}


