# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=python2-pyhdf
pkgver=0.8.3
pkgrel=3
pkgdesc="Python bindings for the HDF library (NetCDF disabled)."
arch=('i686' 'x86_64')
url="http://pysclint.sourceforge.net/pyhdf"
license=('custom')
depends=('python2' 'python2-numpy' 'libjpeg' )
makedepends=('hdf4-nonetcdf')
source=(http://downloads.sourceforge.net/pysclint/pyhdf-$pkgver.tar.gz)
md5sums=('d0d010b8d77c0d2934e02d4cba351971')

build() {
  cd $srcdir/pyhdf-$pkgver
  export NOSZIP=
  python2 setup.py install --root=$pkgdir || return 1
  echo 'public' >> LICENSE
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
