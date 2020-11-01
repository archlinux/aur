# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-biom-format
pkgver=2.1.8
pkgrel=1
pkgdesc="The Biological Observation Matrix (BIOM) Format Project"
arch=('x86_64')
url="http://biom-format.org"
license=('BSD')
depends=('python-numpy' 'python-click' 'python-future' 'python-scipy' 'python-pandas' 'python-six' 'python-h5py')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/biocore/biom-format/archive/${pkgver}.tar.gz")
sha256sums=('91cae2e11702c763eeb8a4e1db3cf120e7cdaae8cc38aaae7163be74e6cff77a')

prepare(){
  cd "biom-format-$pkgver"
  find . -iname "*.pyx" | xargs -n 1 cython
}

build() {
  cd "biom-format-$pkgver"
  python setup.py build
}


package(){
  cd "biom-format-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
