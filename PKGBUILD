# Maintainer: Beej <beej@beej.us>
# Maintainer: Alessandro Schillaci < http://slade.altervista.org >
# Contributor: Alessandro Schillaci < http://slade.altervista.org >
pkgname=inform
pkgver=6.33.1
pkgrel=1
pkgdesc="Interactive fiction compiler"
arch=(i686 x86_64)
url="http://www.inform-fiction.org/"
license=('custom:"freeware"')
depends=('glibc')
groups=(inform)
source=(http://www.ifarchive.org/if-archive/infocom/compilers/inform6/source/$pkgname-$pkgver-b2.tar.gz)

md5sums=('2300594c30f8085207bbd88d6482878f')

build(){
	cd $srcdir/$pkgname-$pkgver-b2
	./configure --prefix=/usr
	make
}


package() {
	cd $srcdir/$pkgname-$pkgver-b2
	make DESTDIR="${pkgdir}" install
	cd $pkgdir/usr/bin/
	ln -sf /usr/bin/inform-6.33b2 inform
}
