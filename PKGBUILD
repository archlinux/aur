# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.31
pkgrel=1
pkgdesc="package dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL-3.0-or-later')
depends=('expat' 'glibc' 'sqlite' 'gcc-libs')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cfc75232ca5ccfacf0c7b1941d9a3e265de14b4a9285a12ce43baf0889fb082b')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr --enable-expat_1_1=no
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
