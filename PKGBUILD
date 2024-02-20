# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.29
pkgrel=1
pkgdesc="GNU Gama package is dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL')
depends=('expat' 'glibc' 'sqlite' 'gcc-libs')
options=(!debug)
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c00fa3c6fff4e777834dfae02afccff2e14884f544f5ac752a0047d56e80b411')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
