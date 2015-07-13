#
# Contributor: Michael Asher < asherlm at gmail dot com > 
#
pkgname=libsmi
pkgver=0.4.8
pkgrel=3
pkgdesc="Libsmi is a C library that allows network management applications and MIB and PIB authoring tools to access SMI MIB information." 
arch=('i686' 'x86_64')
url="http://www.ibr.cs.tu-bs.de/projects/libsmi/"
license=('Custom')
groups=()
depends=()
makedepends=()
provides=('libsmi=$pkgver')
install=libsmi.install
source=(https://www.ibr.cs.tu-bs.de/projects/${pkgname}/download/${pkgname}-${pkgver}.tar.gz
				LICENSE)
sha512sums=('c4f5f30c9fbf26c2e0d87e29783794014a518a7494c17112b1970b5434c698d06ffd529ea58eb7856a0f86a30f1059aaf49d4fbdf39db971d9114d427d8a1863'
            '51121f9dfc80a8fe13392aa98e75c43d312c65f5a7c86d364f3efff9d713f0f455e6040bbe82f1e38e796b316b4dcb6c98d3e8dfa16d751944751dc0fcd0c74e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2:


