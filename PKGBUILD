# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.27
pkgrel=1
pkgdesc="GNU Gama package is dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL')
depends=('expat' 'glibc' 'sqlite' 'gcc-libs')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('938b3b4caff29baf2fe34283cd9a0c3310d614c467b0cba4e95fc6f4ffe33341')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
