# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.33
pkgrel=1
pkgdesc="package dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL-3.0-or-later')
depends=('expat' 'glibc' 'sqlite' 'gcc-libs')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a1a8aac402a90c9ac0f59516029f7763bb5f4e82eecd0334ac2e40e0de43fb5d')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr --enable-expat_1_1=no
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
