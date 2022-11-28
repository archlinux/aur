# Maintainer:  Antoni Przybylik <antoni.przybylik@wp.pl>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=libosmo-dsp
pkgver=0.4.0
pkgrel=1
pkgdesc="A library with SDR DSP primitives"
arch=('x86_64')
url="https://git.osmocom.org/libosmo-dsp/"
license=('GPL2')
depends=('fftw')
makedepends=('git')
source=('git://git.osmocom.org/libosmo-dsp.git')
sha1sums=('SKIP')
_gitname=libosmo-dsp

build()
{
	cd $_gitname
	libtoolize
	aclocal
	autoconf
	autoheader
	automake --add-missing
	./configure --prefix=/usr
	make
}

package()
{
	cd $_gitname
	make DESTDIR="$pkgdir" install
}
