# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-biom-format
_pkgname=biom-format
pkgver=2.1.7
pkgrel=1
pkgdesc="The Biological Observation Matrix (BIOM) Format Project"
arch=('any')
url="http://biom-format.org"
license=('BSD 3-Clause License')
depends=('python-numpy' 'python-click' 'python-future' 'python-scipy' 'python-pandas' 'python-six' 'python-h5py')
makedepends=('python-setuptools')
source=("https://github.com/biocore/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('88b3ef16fd7d16f4e125f1e0d356aaad4c7c281ea3fb746c0f8dc26f3a5b6d4d')

prepare(){
  cd "$srcdir/$_pkgname-$pkgver"
  find . -iname "*.pyx" | xargs -n 1 cython
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
