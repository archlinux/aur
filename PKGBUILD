# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.30
pkgrel=4
pkgdesc="package dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL-3.0-or-later')
depends=('expat' 'glibc' 'sqlite' 'gcc-libs')
options=(!debug)
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3574912fbd06cc83cda4c52b6537bb08a58db0114fceacb7c8c237a00e36f07a')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr --enable-expat_1_1=no
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
