# Mantainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=libofa
pkgver=0.9.3
pkgrel=1
pkgdesc="Open Fingerprint Architecture"
arch=(i686 x86_64)
url="http://www.musicdns.org/"
depends=('expat' 'curl' 'fftw')
makedepends=(pkgconfig)
options=('!libtool')
source=(http://www.musicip.com/dns/files/$pkgname-$pkgver.tar.gz
	gcc-4.patch)
md5sums=('51507d2c4b432bd2755f48d58471696e' 'a6f78b90bd0f4354d022a71c3e58ef6c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ../gcc-4.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

