# Maintainer Marcel Kleinfeller <marcel@oompf.de>

pkgname=coda
pkgver=6.14.0
pkgrel=1
pkgdesc="A distributed file system with disconnected operation."
depends=('bash' 'perl')
arch=(i686 x86_64 armv7h)
url="http://coda.cs.cmu.edu/"
source=("http://coda.cs.cmu.edu/coda/source/$pkgname-$pkgver.tar.xz")
sha512sums=('e131b7e4a8661af05708b55c4210e5ec88c7d46a9af4eb9a82267516f293da00ddf50a4279c88e22c5abb619263c56d42c7265a7fa2f2d81946fd7dd951e8d40')
license=("GPL")

build() {
    cd $pkgname-$pkgver
    ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--sbindir=/usr/bin \
	--libdir=/usr/lib \
	--datadir=/usr/share \
	--includedir=/usr/include \
	--enable-client \
	--enable-server
    make V=0
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="${pkgdir}" install
}
