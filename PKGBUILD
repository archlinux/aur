# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2-types
_pkgname=q2-types
pkgver=2021.2.0.dev0
pkgrel=1
pkgdesc="Definitions of common QIIME 2 types."
arch=('x86_64')
url="https://qiime2.org"
license=('BSD')
depends=(
python
python-qiime2
python-biom-format
python-scikit-bio
python-h5py
python-pandas
python-ijson
)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qiime2/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ec0cbd2cdc20ee2dd9922b5cf40c66d52a637a14982c74ee8d3f022053db994c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
