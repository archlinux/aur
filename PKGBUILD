# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.32
pkgrel=1
pkgdesc="package dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL-3.0-or-later')
depends=('expat' 'glibc' 'sqlite' 'gcc-libs')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ab08c42e28d54939cb339f7ff8fc1d9a2a20241ed9edc2007d46549b9f6dd324')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr --enable-expat_1_1=no
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
