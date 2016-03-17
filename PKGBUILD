pkgname=python2-libewf
_pkgcode=libewf
pkgver=20160124
pkgrel=1
pkgdesc="Libewf is a library to access the Expert Witness Compression Format (EWF)" 
url="https://github.com/libyal/libewf/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')
provides=('libewf')

md5sum=c134579eccc45c3cd25ee5b26c2f3035
source=(https://pypi.python.org/packages/source/l/$_pkgcode-python/$_pkgcode-python-$pkgver.tar.gz#md5=$md5sum)
md5sums=($md5sum)

build() {
  export PYTHON=python2

  cd $srcdir/${_pkgcode}-${pkgver}

  ./configure --enable-python2 --prefix=/usr
  make

}

package() {
  cd $srcdir/${_pkgcode}-${pkgver}
  make DESTDIR="$pkgdir/" install

  #python2 setup.py install --root="${pkgdir}"
}
