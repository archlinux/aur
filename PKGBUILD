# Maintainer: talavis <aur at talavis eu>
# Contributor: Kevin Dodd <jesin00 at gmail dot com>

pkgname=clustal-omega
pkgver=1.2.1
pkgrel=1
pkgdesc="Protein sequence alignment program"
arch=('i686' 'x86_64')
url="http://www.clustal.org/omega/"
license=('LGPL')
depends=('glib2' 'argtable')
source=("http://www.clustal.org/omega/${pkgname}-${pkgver}.tar.gz")
options=(libtool staticlibs)
sha1sums=('50f67eb3244c25c9380e7afef0e157161535121b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr || return
	make
} 

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
