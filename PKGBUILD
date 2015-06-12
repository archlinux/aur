# Contributor: Tom K <tomk@runbox.com>
# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=chgrep
pkgver=1.2.4
pkgrel=3
pkgdesc="Fast pattern replacement utility, grep style"
depends=('glibc')
source=(http://www.sfr-fresh.com/unix/privat/$pkgname-$pkgver.tgz)
md5sums=('9c4306a51550fca58ca4b29c0d31bd79')
url="http://linux.softpedia.com/progDownload/Chgrep-Download-23787.html"
license=("GPL")
arch=('x86_64' 'i686')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
