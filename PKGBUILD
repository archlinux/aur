# Maintainer:  Antoni Przybylik <antoni.przybylik@wp.pl>

pkgname=libosmo-dsp
pkgver=0.4.0
pkgrel=1
epoch=0
pkgdesc="A library with SDR DSP primitives"
arch=('x86_64')
url="https://git.osmocom.org/libosmo-dsp/"
license=('GPL2')
depends=('fftw')
makedepends=('autoconf' 'make' 'git')
source=('git://git.osmocom.org/libosmo-dsp')
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
  ./configure
  make

}

package()
{

  cd $_gitname
  make DESTDIR=${pkgdir} install

}
