# Maintainer: talavis <aur at talavis eu>
# Contributor: Kevin Dodd <jesin00 at gmail dot com>

pkgname=clustal-omega
pkgver=1.2.3
pkgrel=1
pkgdesc="Protein sequence alignment program"
arch=('i686' 'x86_64')
url="http://www.clustal.org/omega/"
license=('LGPL')
depends=('glib2' 'argtable')
source=("http://www.clustal.org/omega/${pkgname}-${pkgver}.tar.gz")
options=(libtool staticlibs)
md5sums=('f92f6ddbc32afc8a8b3026de7f4e15d4')
sha1sums=('7944a8a57fc00dcd56ad16bf9cd2f0914657d8a3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr || return
	make
} 

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
